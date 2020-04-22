Finally, we need to tell the webserver how to route the traffic: which code should be executed for a given URL.

Edit `myproject/cars/urls.py`{{open}}

<pre class="file" data-filename="myproject/cars/urls.py" data-target="replace">from django.urls import path
from . import views

urlpatterns = [
    path("&lt;int:pk&gt;/", views.car_detail, name="car_detail"),
]
</pre>

Note the pattern includes an integer ID - this will allow us to retrieve Car and Driver objects based on the ID provided in the URL.

Now edit `myproject/myproject/urls.py`{{open}} 

Here, we'll define the root URL for the “cars” app, directing Django to look at the file we created above for any URLs where the path starts with /cars/:

<pre class="file" data-filename="myproject/myproject/urls.py" data-target="replace">
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path("cars/", include("cars.urls")),
]
</pre>
