# Native binaries as Github Actions

Writing Github Actions with languages like Rust! 🚀

Inspiration for this is this blog:

- https://full-stack.blend.com/how-we-write-github-actions-in-go.html

A prebuilt way to e.g. use Rust for writing Github Actions. You can use the Dockerfile based approach or just call the native binaries.


You can use a Docker based approach with:


```yml
# action.yml
runs:
  using: 'docker'
  image: 'Dockerfile'

```

Drawbacks for that is that the deps need to be build and and compiled for it to run every time. It might cause siginificant overhead when the Action is called from some pipeline.

The more performant way is to call native binaries and add them to the repository. They can be called by masquarading the default support for NodeJS application on Github actions and then the `action.yml` consists of following definition.


```yml
# action.yml
runs:
  using: node16
  main: index.js

```

It will run the native binaries depending on the arch with nodeJs `child_process.exec`. There are some funky permission issues with this,  so check 'Gotchas' if you run into issues like EACCES or permission denied. 

## Gotchas 

The files need the permissions to be pumped:
- https://github.com/orgs/community/discussions/26239

`git update-index --chmod=+x <binary>`

and write commint after that.