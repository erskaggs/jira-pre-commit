# jira-pre-commit

A [`pre-commit`](https://pre-commit.com) hook to check commit messages for
[Conventional Commits](https://conventionalcommits.org) formatting.

## Usage

Make sure `pre-commit` is [installed](https://pre-commit.com#install).

Create a blank configuration file at the root of your repo, if needed:

```console
touch .pre-commit-config.yaml
```

Add a new repo entry to your configuration file:

```yaml
repos:
  - repo: https://github.com/erskaggs/jira-pre-commit
    rev: <git sha or tag>
    hooks:
      - id: jira-pre-commit
        stages: [commit-msg]
```

Install the `pre-commit` script:

```console
pre-commit install --hook-type commit-msg
```

Make a (normal) commit without a jira ticket:

```console
$ git commit -m "add a new feature"
Jira Ticket Key..........................................................Failed
- hook id: jira-pre-commit
- exit code: 1

Aborting commit. Your commit message is missing either a JIRA Issue, i.e. JIRA-1234.

```

Make a commit with a jira ticket
```console
$ git commit -m "JIRA-1234 add a new feature"
Jira Ticket Key..........................................................Passed
```

## Versioning

Versioning generally follows [Semantic Versioning](https://semver.org/).

In addition to the strict version tag, we also maintain a "latest" tag for each
major version, e.g. `v1` always points to the latest `v1.x.x` tag.

## License

[Apache 2.0](LICENSE)

Inspired by matthorgan's [`pre-commit-conventional-commits`](https://github.com/matthorgan/pre-commit-conventional-commits).
