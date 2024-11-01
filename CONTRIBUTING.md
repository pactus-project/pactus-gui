# Contributing

Thank you for considering contributing to the Pactus blockchain!
Please read these guidelines before submitting a pull request or opening an issue.

## Code Guidelines

We strive to maintain clean, readable, and maintainable code in the Pactus blockchain.
Please follow these guidelines when contributing to the project:

- Follow the principles of clean code as outlined in Robert C. Martin's "[Clean Code](https://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882)" book.
- Write tests for new code or changes to existing code, and make sure all tests pass before submitting a pull request.

### GUI Development

Development of the Pactus Core GUI have some requirements on your machine which you can find a [quick guide about it here](./docs/gtk-gui-development.md).

## Commit Guidelines

Please follow these rules when committing changes to the Pactus blockchain:

- Each commit should represent a single, atomic change to the codebase.Avoid making multiple unrelated changes in a single commit.
- Use the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) format for commit messages and Pull Request titles.

### Commit type

List of conventional commit [types](https://github.com/commitizen/conventional-commit-types/blob/master/index.json):

| Types    | Description                                                                       |
| -------- | --------------------------------------------------------------------------------- |
| fix      | A big fix                                                                         |
| feat     | A new feature                                                                     |
| docs     | Documentation only changes                                                        |
| test     | Adding missing tests or correcting existing tests                                 |
| build    | Changes that affect the build system or external dependencies                     |
| ci       | Changes to our CI configuration files and scripts                                 |
| perf     | A code change that improves performance                                           |
| refactor | A code change that neither fixes a bug nor adds a feature                         |
| style    | Changes that do not affect the meaning of the code (white-space, formatting, etc) |
| chore    | Other changes that don't modify src or test files                                 |

### Commit Scope

The scope helps specify which part of the code is affected by your commit.
It must be included in the commit message to provide clarity.
Multiple scopes can be used if the changes impact several areas.

Here’s a list of available scopes: [available scopes](./.github/workflows/semantic-pr.yml).

### Commit Description

- Keep the commit message under 50 characters.
- Start the commit message with a lowercase letter and do not end with punctuation.
- Write commit messages in the imperative: "fix bug" not "fixed bug" or "fixes bug".

### Examples

  - Correct ✅: "feat(grpc): sign transaction using wallet client"
  - Correct ✅: "feat(grpc, wallet): sign transaction using wallet client"
  - Incorrect ❌: 'feat(gRPC): Sign transaction using wallet client."
  - Incorrect ❌: 'feat(grpc): Sign transaction using wallet client."
  - Incorrect ❌: 'feat(grpc): signed transaction using wallet client"
  - Incorrect ❌: 'sign transaction using wallet client"

## Code of Conduct

This project has adapted the
[Contributor Covenant, version 2.1](https://www.contributor-covenant.org/version/2/1/code_of_conduct/)
to ensure that our community is welcoming and inclusive for all.
Please read it before contributing to the project.

---

Thank you for your contributions to the Pactus blockchain!
