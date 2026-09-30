# controle-digital
Este repositório contém os projetos elaborados durante a disciplina de Controle Digital, em 2026/2, na UTFPR Campus Apucarana.

## Projetos

| Pasta | Tema |
| --- | --- |
| [`projeto_1/`](projeto_1/) | Projeto de controlador digital por lugar das raízes (root locus) |

## Requisitos

- MATLAB R2026a
- Control System Toolbox
- Simulink

## Estrutura

Cada projeto fica em sua própria pasta (`projeto_N/`), com o mesmo padrão:

```
projeto_N/
├── README.md          # descrição, resultados e como executar
├── enunciado.pdf      # enunciado fornecido pelo professor
├── projeto_N.mlx      # live script com o desenvolvimento do projeto
├── *.slx              # modelo(s) do Simulink
└── figuras/           # gráficos exportados
```

Arquivos gerados automaticamente pelo Simulink (`slprj/`, `*.slxc`) não são versionados. Veja o [`.gitignore`](.gitignore).

## Licença

Distribuído sob a licença MIT. Veja [`LICENSE`](LICENSE).
