# gilberto.martinez.phd

Personal academic website of **Gilberto G. Briscoe-Martinez** — PhD student in the
[HIRO Group](https://hiro-group.ronc.one/) at the University of Colorado Boulder and
NASA Space Technology Graduate Researcher.

Live at **<https://gilberto.martinez.phd>**.

The site collects my research in one place: an about page, current and past
projects, publications, teaching, news, and downloadable CV/resume PDFs. It is
a static [Jekyll](https://jekyllrb.com/) site derived from the
[al-folio](https://github.com/alshedivat/al-folio) theme, hosted on GitHub Pages.

## Where content lives

| Content | Location |
| --- | --- |
| About page | `_pages/about.md` |
| Projects | `_projects/*.markdown`, rendered as a grid via `_pages/projects.md` |
| Publications | `_bibliography/papers.bib` (BibTeX), rendered by jekyll-scholar; co-author links in `_data/coauthors.yml` |
| News items | `_news/`, shown on the home page |
| Teaching | `_pages/teaching.md` |
| CV / resume PDFs | LaTeX sources in `cv/` (Awesome-CV) and `resume/` (Deedy), compiled into `assets/pdf/` |
| Site-wide settings | `_config.yml` (name, description, nav, library versions) |

## Local development

```bash
bundle install
bundle exec jekyll serve   # http://localhost:4000
```

## Building the CV and resume

The PDF sources live in this repo; the LaTeX classes and fonts come from the
`cv-templates/Awesome-PhD-CV` submodule.

```bash
git submodule update --init
make          # builds both assets/pdf/cv.pdf and assets/pdf/resume.pdf
make cv       # just the CV
make resume   # just the resume
```

Requires `xelatex` and the template fonts (on Ubuntu:
`sudo apt install texlive-xetex texlive-fonts-recommended texlive-fonts-extra`).

## Deployment

Pushing to `main` triggers the GitHub Actions workflow
(`.github/workflows/deploy.yml`), which builds the site and publishes `_site`
to the `gh-pages` branch. The custom domain is set in `CNAME`.

Third-party frontend dependencies are kept deliberately minimal: MathJax and
the syntax-highlighting CSS are self-hosted in `assets/`, and the remaining
CDN assets (Bootstrap, Font Awesome, Masonry) are version-pinned with
subresource-integrity hashes in `_config.yml`. Workflow actions are pinned to
commit SHAs.

## License

Based on the MIT-licensed [al-folio](https://github.com/alshedivat/al-folio)
theme; see [LICENSE](LICENSE).
