## Katacoda's UI

We'll work through this tutorial using the file editor to the top-right, and the terminal to the bottom-right. The system we're working with is based on Ubuntu Linux, you're logged in with root privileges, and most standard commands are available.

From time to time, I'll include commands that must be run in the terminal - you can type these in yourself, or click the listing to run it. Let's start by setting up a directory to work in under /var/projects:

```
mkdir /var/projects/myproject
cd /var/projects/myproject
```{{execute}}

When you see a link to a file in this tutorial, clicking it will open it in the editor. You may also browse through most files below /var/projects using the tree shown to the left of the editor. 

Let's edit `cars.csv`{{open}} (click that link!)

Add some data to that file by clicking "Copy to Editor" on the listing below:

<pre class="file" data-filename="cars.csv" data-target="replace">1,Ford,F-150,2004,01083da2df15d6ebfe62186418a76863,1
2,Toyota,Sienna,2014,53092a17afa460689ca931f0d459e399,1
3,Honda,Civic,2018,844c56840b5fc26d414cf238381a5f1a,2
4,GMC,Sierra,2012,29aeffa4d5aa21d25d7196db3728f72c,2</pre>

In some cases, you'll need to write or copy text into a file, so let's do the next one a bit differently. 

Open: `drivers.csv`{{open}}

The listing below can be clicked to copy the text to your clipboard.

```
1,John Doe,Z1234567
2,Jane Doe,Z9876543
```{{copy}}

Paste that into drivers.csv, please - we'll use this data later on! 

Note: file are saved as soon as you make changes to them.
