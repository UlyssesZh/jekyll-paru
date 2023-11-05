# jekyll-paru

Jekyll plugin for using [Paru](https://github.com/htdebeer/paru) to render Markdown.

## Installation

In the Gemfile of your Jekyll site, add:

```ruby
gem 'jekyll-paru', group: :jekyll_plugins
```

And add the following to your `_config.yml`:

```yaml
plugins:
  - jekyll-paru
```

## Configuration

In `_config.yml`:

```yaml
markdown: Paru
paru:
  # All options are optional
  exec: /path/to/pandoc
  options:
    # Look at https://github.com/htdebeer/paru/blob/master/lib/paru/pandoc_options.yaml for all options
    no_highlight: true
    shift_heading_level_by: 1
    filters:
      - pandoc-crossref
      - pandoc-katex
    metadata:
      - crossrefYaml=_data/crossref.yaml
```
