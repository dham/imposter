imposter an improved version of the a0poster class.
====================================================

This is a customised version of the a0poster class originally written
by Gerlinde Kettl and Matthias Weiser. 

INSTALLING
----------

On a *nix system, you ought to be able to simply type "make install" as
root. The Makefile will install the files in the local LaTeX tree and
tell LaTeX that they are there. 

Alternatively, as a normal user you should be able to type "make
install INSTALLDIR=~" and the files will be installed a texmf
directory in your home directory and latex will know how to find them.

If this fails, or if you do not run a Unix-like system, documentation
on how to install the files can be found at:
http://www.tex.ac.uk/cgi-bin/texfaq2html?label=instpackages

PRODUCING A POSTER
------------------

Use from example.tex as a template and make changes as appropriate. ;)

KNOWN ISSUES
------------

* You will need to produce a pdf (for example with ps2pdf). The dvi
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

FILES
-----

README (this file)
Makefile (makefile defining installation rules and some LaTeX rules)
example.tex (example poster)
imposter.cls (the class file itself)
a0size (package \inputed by a0poster.cls)
imperial.eps (Imperial College Logo)
delfin_colour.eps (Delfin logo)

BUGS
----

Please report bugs to David. 

David Ham (David.Ham@imperial.ac.uk)

