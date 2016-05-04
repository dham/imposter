imposter an improved version of the a0poster class from Imperial College London
===============================================================================

This is a heavily modified version of the a0poster class originally written
by Gerlinde Kettl and Matthias Weiser. 

INSTALLING
----------

On an Ubuntu (or closely related) system, you can directly install the
latex-imposter package:

    sudo apt-add-repository ppa:david-ham
    sudo apt-get update
    sudo apt-get install latex-imposter

On other Unix-like systems (including other Linux distributions and
Mac), installation from the git repository should be straightforward:

    git clone https://github.com/dham/imposter.git
    cd imposter
    make install


DOCUMENTATION AND PRODUCING POSTERS
-----------------------------------

Important information on producing posters with the imposter is
provided on the example poster. On Ubuntu this can be found at:

    /usr/share/texmf/doc/latex/imposter/example_mpecdt.pdf

while on other systems it will be found in the imposter source
directory, and at:

   $(kpsewhich -var-value TEXMFHOME)/doc/latex/imposter/example_mpecdt.pdf

Use from example.tex as a template and make changes as appropriate. ;)

KNOWN ISSUES
------------

* You will need to produce a pdf (for example with dvipdf). The dvi
  and postscript versions will be mangled.

* Because the package uses pstricks, pdflatex won't work.


WRITING A NEW POSTER STYLE
--------------------------

Use one of the poster style commands listed in imposter.cls as a
template. The basic idea is to use rput to lay out the various
elements of the poster where you want them. rput units are mm and the
origin is the bottom left hand corner of the page. Take note of the
need to lay out the main \posterbox somewhere.

To enable the use of your poster style you will need to add a new
\ifthenelse case to the definition of the \posterstyle command.

BUGS
----

Please report bugs to David. 

David Ham (David.Ham@imperial.ac.uk)

