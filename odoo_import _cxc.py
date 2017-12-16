import xmlrpc.client
import functools
import csv
from datetime import date, datetime
import time

HOST     = '111.111.111.111' 
PORT     = 8069
database = 'desarrollo_test'
user     = 'tucuentadeodoo@gmail.com'
pwd      = 'holaamigosdeodoo@@jajajaja'
root     = 'http://%s:%d/xmlrpc/' % (HOST,PORT)

type = 'in'
sequence_opt = 'custom'
    
uid = xmlrpc.client.ServerProxy(root + 'common').login(database,user,pwd)
call = functools.partial(xmlrpc.client.ServerProxy(root + 'object').execute,database,uid,pwd)
filename = open('C:\Desarrollo\Healthy\cxc_file.csv','r',newline = '')
reader = csv.reader(filename,delimiter = ',')

def find_partner(name):
    partner = call('res.partner','search', [('name','ilike',name)])[0]    
    return partner #return call('res.partner','search_read', [('name','ilike',name)], ['name','ref','property_account_receivable_id'])

def find_sales_person(name):
    partner_search = call('res.users','search', [('name','ilike',name)])[0]
    if partner_search:
        return partner_search
    else:
        raise Warning(_('Not Valid Salesperson Name "%s"') % name)

def find_currency(name):    
    currency_search = call('res.currency','search', [('name','ilike',name)])[0]
    if currency_search:
        return currency_search
    else:
        raise Warning(_(' "%s" Currency are not available.') % name)    

def find_invoice_date(date):
    DATETIME_FORMAT = "%Y-%m-%d"
    i_date = datetime.strptime(date, DATETIME_FORMAT)
    
    return i_date

def find_cuenta(name):
    account_search = call('account.account','search', [('name','=',name)])[0]
    return account_search

def find_property(name):    
    account_search = call('ir.property','search_read', [('name','ilike',name)],['value_reference'])    
    for cc in account_search:
        cuenta  = cc['value_reference'].split(",")[1] 
        
    account_search = call('account.account','search', [('id','=',cuenta)])[0] 
    return account_search   

def search_invoice_data(invoice):
    account_search = call('account.invoice','search_read', [],['name','partner_id'])
    
    for cc in account_search:
        print( "%s %s" %(cc['partner_id'],cc['name']) )
    return 7

def search_product(name):
    product = call('product.product','search', [('name','ilike',name)])[0]

    return product
    
def make_invoice(row):
    values = {}        
    for i in range(len(row)):
        keys = ['invoice', 'customer', 'currency', 'product', 'quantity', 'uom', 'description', 'price','salesperson','tax','date']
        values.update({keys[i]:row[i]})
        
        if values:
            if i == 0:
                continue
            else:
                values.update({'type':type,'seq_opt':sequence_opt})

    name           = values.get('invoice')
    account_id     = find_cuenta('Cuenta por Cobrar a Clientes') #find_property('property_account_income_categ_id')
    partner_id     = find_partner(values.get('customer')) 
    currency_id    = find_currency(values.get('currency'))
    salesperson_id = find_sales_person(values.get('salesperson'))
    inv_date       = values.get('date') ##find_invoice_date(values.get('date'))
    type_inv       = "out_invoice"
    journal_id     = find_journal('Facturas Especiales')
    
    inv_id = call('account.invoice', 'create', {'account_id' : account_id,
                                                'partner_id' : partner_id,
                                                'currency_id' : currency_id,
                                                'user_id':salesperson_id,
                                                'name':name,
                                                'custom_seq': True if values.get('seq_opt') == 'custom' else False,
                                                'system_seq': True if values.get('seq_opt') == 'system' else False,
                                                'type' : type_inv,
                                                'date_invoice':inv_date,
                                                'journal_id':journal_id,
                                                'reference':'HIST'})

    make_invoice_line(values,inv_id)

def get_unit_measure(name):
    product = call('product.uom','search', [('name','ilike',name)])[0]
    return product

def find_journal(name):
    journal = call('account.journal','search', [('name','ilike',name)])[0]
    return journal


def make_invoice_line(values, inv_id):
    account_id  =  find_cuenta('Ventas Bienes Historico')#find_property('property_account_income_categ_id') #find_property('property_account_expense_categ_id')
    product_id  = search_product(values.get('product'))
    product_uom = get_unit_measure('Unit(s)')    

    inv = call('account.invoice.line', 'create', {'product_id' : product_id,
                                                  'quantity' : values.get('quantity'),
                                                  'price_unit' : values.get('price'),
                                                  'name' : values.get('description'),
                                                  'account_id' : account_id,
                                                  'uom_id' : product_uom,
                                                  'invoice_id' : inv_id})
    
    print("Proceso finalizado factura # %d "%(inv_id))
    
def inicio():
    for row in reader:
        make_invoice(row)
        #partner        = find_partner(row[1]) 
        #currency_id    = find_currency(row[2])
        #salesperson_id = find_sales_person(row[8])
        #inv_date       = find_invoice_date(row[10])
        #account_search = find_property('property_account_income_categ_id')
        #account_search = find_property('property_account_expense_categ_id')
        
inicio()

    
