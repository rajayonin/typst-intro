# Transparencias para la charla "Memorias de p**** madre: Introducción a Typst"
[Grabación de la charla](https://youtu.be/Apaqtno3ACE).


## Compilation
This presentation uses [Touying](https://touying-typ.github.io/), a [Typst](https://typst.app) presentation package.  
You first need to install the [Typst](https://typst.app) compiler (version, at the time of writting, 0.14.0).

Handout (default) mode:
```
typst c transparencias.typ
```

Presentation mode:
```
typst c --input PRESENTATION=1 transparencias.typ
```

[Pympress](https://pympress.github.io/) mode:
```
typst c --input PYMPRESS=1 transparencias.typ
```



## Cool info
- [Official Touying documentation](https://touying-typ.github.io/docs)
- [Official Typst documentation](https://typst.app/docs)
