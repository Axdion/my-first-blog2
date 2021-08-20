[33mcommit 927e4fe9f787c0f282c241535cf359363bef8d7c[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m)[m
Author: Anibal Corini <lightdestroyers.arca@gmail.com>
Date:   Thu Aug 19 22:10:23 2021 -0400

    Agregadas vistas y plantilla para el detalle del post, asi tambien CSS para el sitio

[1mdiff --git a/blog/templates/blog/base.html b/blog/templates/blog/base.html[m
[1mnew file mode 100644[m
[1mindex 0000000..3c7500e[m
[1m--- /dev/null[m
[1m+++ b/blog/templates/blog/base.html[m
[36m@@ -0,0 +1,30 @@[m
[32m+[m[32m{% load static %}[m
[32m+[m
[32m+[m[32m<html>[m
[32m+[m[32m  <head>[m
[32m+[m[32m    <title>Django Girls Blog</title>[m
[32m+[m[32m    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">[m
[32m+[m[32m    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">[m
[32m+[m[32m    <link rel="stylesheet" href='{% static 'css/blog.css'%}'>[m
[32m+[m[32m    <link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">[m
[32m+[m[32m  </head>[m
[32m+[m
[32m+[m[32m  <body>[m
[32m+[m[32m      <div class="page-header">[m
[32m+[m[32m        <h1><a href="/"> Django Girls Blog </a>  </h1>[m
[32m+[m[32m      </div>[m
[32m+[m
[32m+[m[32m      <div class="content container">[m
[32m+[m[32m    <div class="row">[m
[32m+[m[32m        <div class="col-md-8">[m
[32m+[m[32m          {% block content%}[m
[32m+[m[32m          {% endblock%}[m
[32m+[m
[32m+[m[41m        [m
[32m+[m
[32m+[m[32m        </div>[m
[32m+[m[32m    </div>[m
[32m+[m[32m</div>[m
[32m+[m
[32m+[m[32m  </body>[m
[32m+[m[32m</html>[m
[1mdiff --git a/blog/templates/blog/post_detail.html b/blog/templates/blog/post_detail.html[m
[1mnew file mode 100644[m
[1mindex 0000000..88036a9[m
[1m--- /dev/null[m
[1m+++ b/blog/templates/blog/post_detail.html[m
[36m@@ -0,0 +1,14 @@[m
[32m+[m[32m{% extends 'blog/base.html' %}[m
[32m+[m
[32m+[m[32m{% block content %}[m
[32m+[m[32m    <div class="post">[m
[32m+[m[32m        {% if post.published_date %}[m
[32m+[m[32m            <div class="date">[m
[32m+[m[32m                {{ post.published_date }}[m
[32m+[m[32m            </div>[m
[32m+[m[41m            [m
[32m+[m[32m        {% endif %}[m
[32m+[m[32m        <h2>{{ post.title }}</h2>[m
[32m+[m[32m        <p>{{ post.text|linebreaksbr }}</p>[m
[32m+[m[32m    </div>[m
[32m+[m[32m{% endblock %}[m
[1mdiff --git a/blog/templates/blog/post_list.html b/blog/templates/blog/post_list.html[m
[1mindex edf4670..21abb46 100644[m
[1m--- a/blog/templates/blog/post_list.html[m
[1m+++ b/blog/templates/blog/post_list.html[m
[36m@@ -1,23 +1,14 @@[m
[31m-<html>[m
[31m-  <head>[m
[31m-    <title>Django Girls Blog</title>[m
[31m-    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">[m
[31m-<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">[m
[31m-  </head>[m
[31m-[m
[31m-  <body>[m
[31m-      <div>[m
[31m-        <h1><a href="/"> Django Girls Blog </a>  </h1>[m
[31m-      </div>[m
[31m-[m
[31m-      {% for post in posts%}[m
[31m-        <div>[m
[31m-          <p> Publicado: {{post.published_date}}</p>[m
[31m-          <h2><a href=""> {{post.title}}</a><h2>[m
[31m-          <p>{{post.text|linebreaksbr}}</p>[m
[31m-[m
[31m-        </div>[m
[31m-      {% endfor%}[m
[31m-[m
[31m-  </body>[m
[31m-</html>[m
[32m+[m[32m{% extends 'blog/base.html' %}[m
[32m+[m
[32m+[m[32m{% block content%}[m
[32m+[m
[32m+[m[32m            {% for post in posts %}[m
[32m+[m[32m                <div class="post">[m
[32m+[m[32m                    <div class="date">[m
[32m+[m[32m                        <p>publicado: {{ post.published_date }}</p>[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                    <h2><a href="{% url 'post_detail' pk=post.pk  %}">{{ post.title }}</a></h2>[m
[32m+[m[32m                    <p>{{ post.text|linebreaksbr }}</p>[m
[32m+[m[32m                </div>[m
[32m+[m[32m            {% endfor %}[m
[32m+[m[32m{% endblock %}[m
[1mdiff --git a/blog/urls.py b/blog/urls.py[m
[1mindex 59a2d0e..dd743f5 100644[m
[1m--- a/blog/urls.py[m
[1m+++ b/blog/urls.py[m
[36m@@ -2,5 +2,6 @@[m [mfrom django.urls import path[m
 from . import views[m
 [m
 urlpatterns = [[m
[31m-    path('', views.post_list, name='post_list')[m
[32m+[m[32m    path('', views.post_list, name='post_list'),[m
[32m+[m[32m    path('post/<int:pk>/', views.post_detail, name='post_detail'),[m
 ][m
[1mdiff --git a/blog/views.py b/blog/views.py[m
[1mindex c8be352..505a072 100644[m
[1m--- a/blog/views.py[m
[1m+++ b/blog/views.py[m
[36m@@ -1,8 +1,15 @@[m
 from django.shortcuts import render[m
 from django.utils import timezone[m
 from .models import Post[m
[32m+[m[32mfrom django.shortcuts import render, get_object_or_404[m
[32m+[m
 # Create your views here.[m
 [m
[32m+[m
 def post_list(request):[m
     posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')[m
     return render(request, 'blog/post_list.html', {'posts': posts})[m
[32m+[m
[32m+[m[32mdef post_detail(request, pk):[m
[32m+[m[32m    post = get_object_or_404(Post, pk=pk)[m
[32m+[m[32m    return render(request, 'blog/post_detail.html', {'post': post})[m
