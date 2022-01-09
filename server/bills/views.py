from django.shortcuts import render

# Create your views here.

def index(request):
    return render(request, 'index.html', context={'text': 'Hello World!'})

def index2(request):
    return render(request, 'index2.html', context={'text': 'Hello World!'})

def index3(request):
    return render(request, 'index3.html', context={'text': 'Hello World!'})
