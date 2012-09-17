# University of Montana-Missoula ACM Chapter

This site uses [Jekyll](https://github.com/mojombo/jekyll) to generate the
static pages and [Markdown](http://daringfireball.net/projects/markdown/) to
format them.

## Prerequisites

The server simply runs static files, but on your local machine, you need:

- A Unix-like environment is assumed
- Ruby (only tested with 1.9.3, but 1.8.7 might work)
- Bundler (`gem install bundler`)

Once you have these tools:

1. Clone the project `git clone git@github.com:umt-cs/umt-cs.github.com.git`
2. Setup an ssh alias `acm` for the production server
2. From the project directory, download dependencies with bundler:
   `bundle install`
3. Launch a local copy: `rake server`
4. Visit the site at http://localhost:4000

## Adding a New Post

```sh
# posts are in the format of YYYY-MM-DD-slug.md (markdown)
cp _posts/2011-12-09-last-meeting.md _posts/$(date "+%Y-%m-%d")-meeting.md
# open the file you just created in emacs, vim, etc.
$EDITOR !$
# once you're done, check the site in the server. If it's not already running:
rake server
# if you're satisfied with the formatting, commit:
git commit
# push
git push
# then deploy
rake deploy
```

## Tips

- Write
  [good commit messages](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)
- Don't deploy to production without committing (and if you have time, edit
  the `Rakefile` to prevent this)
- Don't use Windows line-endings
