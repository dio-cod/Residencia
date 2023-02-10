from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
# Create your views here.
def home(request):
    return render (request, 'home.html', {
      'form':UserCreationForm
  })

def signup(request):
    if request.method=='GET':
       return render (request, 'signup.html', {
      'form':UserCreationForm
  })
    else:
        if request.POST['password1']==request.POST['password2']:
            #register user
            try:
                user =User.objets.create_user(username=request.POST['username'], password=request.POST['password'])
                user.save()
                return HttpResponse('User created sucessfully')
            except:
                return HttpResponse('username already exists')
        return HttpResponse('passwords do not match')
