from io import BytesIO
import pytesseract as tess
from PIL import Image
import re

def img_to_text(img: str):
    img = Image.open(img)
    text = tess.image_to_string(img)
    text = text[text.find('Lei\n') + 4:text.find("\nSUBTOTAL")]
    text = text.split("\n")
    return text

def img_to_bill(img: str):
    products = []
    i = 0
    text = img_to_text(img)
    while i < len(text):
        line = text[i]
        line = line.replace(',', '.')
        try:
            quantity, price = line.split("x")
            is_countable = False
            if 'BUC' in quantity:
                is_countable = True
                quantity = float(re.split(r"\.", quantity)[0])
            else:
                quantity = float(re.split(r'\s', quantity)[0])
            price = float(price)
            name = re.split(r'\d+[\.,]\d*', text[i + 1])[0]
            products.append({'name' : name, 'price': price, 'quantity': quantity, 'is_countable': is_countable})
        except:
            return products
        i += 2
    return products

if __name__ == "__main__":
    import sys
    print(img_to_bill(sys.argv[1]))
