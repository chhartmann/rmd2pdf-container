# rmd2pdf-container

Container expects volume /home/vscode/cv to be mounted.

It monitors the file /home/vscode/cv/cv.rmd and creates a new cv.html and cv.pdf automatically.

Example usage: docker run -t -v $PWD/cv:/home/vscode/cv ghcr.io/chhartmann/rmd2pdf-container:main
