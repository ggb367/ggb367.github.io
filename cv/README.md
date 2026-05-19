# CV --- Awesome-CV format

Personalized academic CV for Gilberto G. Briscoe-Martinez, built on
[Awesome-CV](https://github.com/posquit0/Awesome-CV) via the
`LimHyungTae/Awesome-PhD-CV` submodule in `cv-templates/`.

## Layout

- `cv.tex` --- top-level document; sets header, footer, colors, and
  `\input{}`s each section.
- `sections/` --- one file per section. Edit these to update the CV.
  - `aboutme.tex` --- summary + highlights + research interests
  - `education.tex`
  - `experience.tex` --- research & work experience
  - `research_projects.tex` --- selected funded projects / lab efforts
  - `publications.tex`
  - `honors.tex`
  - `teaching.tex`
  - `service.tex`

## Build

From the repo root:

```bash
make cv         # rebuilds cv/cv.pdf and copies it to assets/pdf/cv.pdf
```

Requires `xelatex` and the fonts referenced by Awesome-CV
(Roboto family). On Ubuntu:

```bash
sudo apt install texlive-xetex texlive-fonts-recommended texlive-fonts-extra
```

## Updating the underlying template

```bash
git submodule update --remote cv-templates/Awesome-PhD-CV
```

The class file (`awesome-cv.cls`) lives inside the submodule; we never
copy it here, so updates flow through automatically.
