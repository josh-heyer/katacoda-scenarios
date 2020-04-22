We need to tell Django how to pull stuff out of the database and display it. That's done with a "view" - a Python function that handles the request, retrieves the necessary data, and generates HTML.

Edit `myproject/cars/views.py`{{open}}

<pre class="file" data-filename="myproject/cars/views.py" data-target="replace">from django.shortcuts import render
from cars.models import Car, Driver

def car_detail(request, pk):
    owner_obj = Driver.objects.get(pk=pk)
    car_objs = Car.objects.filter(owner_id=owner_obj.id)
    context = {
        "vehicles": car_objs,
        "drivers": owner_obj,
    }
    return render(request, "car_detail.html", context)
</pre>

Here, `pk` is the ID of the driver. With that,  we retireve the matching row from Postgres and then pull all of the cars owned by this driver. The queries for this are generated on demand by Django based on the models we defined in step #8 - we get to treat them just like Python objects.

The last line renders the HTML based on an HTML template, to which we pass our `context` object containing the data we retrieved. We'll create that template in two parts: a "base" template that defines the structure of the page, and a template that inherits from it to define the specific elements needed to display this data. That way, we're able to create new templates for different sections of the data without repeating the standard page elements each time.

Create `myproject/cars/templates/base.html`{{open}}

And add the base structure for the page:

<pre class="file" data-filename="myproject/cars/templates/base.html" data-target="replace">&lt;html&gt;
    &lt;head&gt;
        &lt;meta charset="utf-8"&gt;
        &lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;

        &lt;title&gt;Contacts&lt;/title&gt;
        &lt;link rel="stylesheet" href="https://unpkg.com/tachyons@4.10.0/css/tachyons.min.css"/&gt;
    &lt;/head&gt;

    &lt;body&gt;
{% block page_content %}{% endblock %}
    &lt;/body&gt;
&lt;/html&gt;</pre>

Observe the `{% block page_content %}{% endblock %}` bit: that'll be replaced by our context-specific markup. Django's template language uses `{% %}` to identify special commands that will be replaced at runtime.

Create `myproject/cars/templates/car_detail.html`{{open}}

And add the following:

<pre class="file" data-filename="myproject/cars/templates/car_detail.html" data-target="replace">{% extends "base.html" %}
{% block page_content %}
        &lt;div class="mw6 center pa3 sans-serif"&gt;
            &lt;h1 class="mb4"&gt;Driver: {{ drivers.name | linebreaks }}&lt;/h1&gt;
            &lt;header class="b mb2"&gt;License: {{ drivers.license }}&lt;/header&gt;
        {% for v in vehicles %}
            &lt;div class="pa2 mb3 striped--near-white"&gt;
                &lt;div class="pl2"&gt;
                    &lt;p class="mb2"&gt;Make/Model: {{ v.make }} {{ v.model }}&lt;/p&gt;
                    &lt;p class="mb2"&gt;Year: {{ v.year }}&lt;/p&gt;
                    &lt;p class="mb2"&gt;Vin: {{ v.vin }}&lt;/p&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        {% endfor %}
        &lt;/div&gt;
{% endblock %}
</pre>

There are a lot more of Django's templating commands here! The first one specifies our base template; the next defines a block named "page_content" which we referenced in that base template earlier. For more details on how Django templates work, refer to [The Django template language](https://docs.djangoproject.com/en/3.0/ref/templates/language/).