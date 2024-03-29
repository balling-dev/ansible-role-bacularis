# Please contribute

You can really make a difference by:

- [Making an issue](https://help.github.com/articles/creating-an-issue/). A well
described issue helps a lot. (Have a look at the [known
issues](https://github.com/search?q=user%3Aballing-dev+is%3Aissue+state%3Aopen).)
- [Making a pull
request](https://services.github.com/on-demand/github-cli/open-pull-request-github)
when you see the error in code.

I'll try to help and take every contribution seriously.

It's a great opportunity for me to learn how you use the role and also an
opportunity to get into the habit of contributing to open source software.

## Step by step

Here is how you can help, a lot of steps are related to GitHub, not specifically
my roles.

### 1. Make an issue

When you spot an issue,
[create an issue](https://github.com/balling-dev/ansible-role-bacularis/issues).

Making the issue helps me and others to find similar problems in the future.

### 2. Fork the project

On the top right side of
[the repository on GitHub](https://github.com/balling-dev/ansible-role-bacularis),
click `fork`. This copies everything to your GitHub namespace.

### 3. Make the changes

In you own GitHub namespace, make the required changes.

I typically do that by cloning the repository (in your namespace) locally:

```bash
git clone git@github.com:YOURNAMESPACE/ansible-role-bacularis.git
```

Now you can start to edit on your laptop.

### 4. Optionally: test your changes

Install [molecule](https://ansible.readthedocs.io/projects/molecule/) and
[Tox](https://tox.wiki):

```bash
pip install molecule tox ansible-lint docker
```

And run `molecule test`. If you want to test a specific distribution, set
`image` and optionally `tag`:

```bash
image=centos tag=7 molecule test
```

Once it starts to work, you can test multiple version of Ansible:

```bash
image=centos tag=7 tox
```

### 6. Make a pull request

[GitHub](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request-from-a-fork) on pull requests.

In the comment-box, you can
[refer to the issue number](
https://help.github.com/en/github/writing-on-github/autolinked-references-and-urls)
by using #123, where 123 is the issue number.

### 7. Wait

Now I'll get a message that you've added some code. Thank you, really.

CI starts to test your changes.
