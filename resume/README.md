# Resume --- Deedy format

Personalized one-page industry resume for Gilberto G. Briscoe-Martinez,
built on the [Deedy Resume template](https://github.com/deedy/Deedy-Resume)
via the `LimHyungTae/Awesome-PhD-CV` submodule in `cv-templates/`.

## Layout

`resume.tex` is a single self-contained file with two columns:

- **Left (33%)** --- Skills, Links, Education
- **Right (66%)** --- Experience, Selected Projects, Publications, Awards

## Customizing per application

The **Selected Projects** block is the section to tailor for each job
application. Suggested swaps:

| Target team                         | Emphasize                                     |
|-------------------------------------|-----------------------------------------------|
| Manipulation / autonomy / robotics  | DEFT + non-prehensile failure recovery        |
| Controls / safety-critical          | CERG + reference-governor work                |
| Industrial / warehouse robotics     | Plus One Robotics sorting + recovery          |
| Generalist SWE / ML                 | DEFT (diffusion policies) + Plus One vision   |

## Build

From the repo root:

```bash
make resume     # rebuilds resume/resume.pdf and copies to assets/pdf/resume.pdf
```

Requires `xelatex` and the fonts Lato + Raleway. On Ubuntu:

```bash
sudo apt install texlive-xetex texlive-fonts-recommended texlive-fonts-extra
```

The fonts shipped with the submodule (`cv-templates/Awesome-PhD-CV/deedy-format/fonts/`)
are loaded via `TEXINPUTS` by the top-level `Makefile` --- no extra setup
required.

## Updating the underlying template

```bash
git submodule update --remote cv-templates/Awesome-PhD-CV
```
