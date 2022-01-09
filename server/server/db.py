from server.models import User, Bill, Product
import string, random

def create_new_user(username):
    user = User(name=username)
    user.save()
    return user.id

def create_new_bill(author_id, products):
    bill = Bill(author=User.objects.get(pk=author_id), some_id=''.join(random.choices(string.ascii_uppercase + string.digits, k=6)))
    bill.save()
    for p in products:
        new_product = Product(name=p['name'], price=p['price'], quantity=p['quantity'], is_countable=p['is_countable'], bill_id=bill)
        new_product.save()
    return bill.some_id
        