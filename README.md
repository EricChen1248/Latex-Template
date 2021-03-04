# Latex-Template
To run latex on a new machine requires building the custom docker image. Use docker-compose build in the directory. VScode will also require updating settings to change
```"latex-workshop.docker.image.latex": "latex_custom",``` to point to our own image.

To use the template, add
```latex
\documentclass[title=Title,class=Class Name]{homeworkTemplate}
```

At the beginning of the ```.tex``` file.
