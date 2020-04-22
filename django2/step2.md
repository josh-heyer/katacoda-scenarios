When working with Python, it is a good practice to use a virtual environment which allows tools and libraries to be isolated from those of other apps in use or under development on your workstation. This prevents dependency collisions and undesired behaviors that would otherwise arise from premature or unintended version changes - think of it as good Python hygiene. There are many tools available for this purpose: complete virtual machines such as VirtualBox, container systems such as Docker, and several Python-specific solutions such as Virtualenv, Pipenv, and Conda.

For this tutorial, we'll be using [virtualenv](https://virtualenv.pypa.io/en/latest/) along with Python v. 3.x. You can install virtualenv using pip:

```
pip install virtualenv
```{{execute}}
(if you're not already logged in as root, you'll want to prefix that command with `sudo `. This is the ONLY step that needs root access!)


We'll use virtualenv to keep all of our changes from spilling out of the project directory we created in step #1. We'll also specify the version of Python we wish to use in this project:

```
virtualenv -p python3 /var/projects/myproject/myprojectenv

```{{execute}}

This command will have created a local - "virtual" - Python environment in the named directory below our project, which you can now observe:

```
ls /var/projects/myproject/myprojectenv
```{{execute}}

To start work, we need to "activate" this environment - once activated, all Python commands will operate using our virtual environment. 

```
source /var/projects/myproject/myprojectenv/bin/activate

```{{execute}}

Your command prompt should now have a `(myprojectenv) ` prefix, indicating your active virtual environment. When deactivated (manually or when you close the terminal), you can be assured that your project configuration won't interfere with that of other Python projects on the same machine!

[![](https://imgs.xkcd.com/comics/python_environment.png)](https://xkcd.com/1987/ "The Python environmental protection agency wants to seal it in a cement chamber, with pictorial messages to future civilizations warning them about the danger of using sudo to install random Python packages.")

