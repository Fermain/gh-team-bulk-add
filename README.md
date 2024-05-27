# GitHub Team Membership Management Scripts

This repository contains scripts to add users to GitHub teams within an organization using the GitHub CLI (`gh`). There are two main scripts:

1. `add_user_to_group.sh`: Adds a single user to a specified team.
2. `batch_add_users_to_groups.sh`: Adds multiple users to specified teams based on a CSV file.

## Prerequisites

- Ensure the GitHub CLI (`gh`) is installed and authenticated. You can install it from [GitHub CLI](https://cli.github.com/).
- Make sure you have the necessary permissions to manage the teams and add members in your organization.

## Scripts

### `add_user_to_group.sh`

This script adds a single user to a specified team within an organization.

#### Usage

```bash
./add_user_to_group.sh -o <organization> -g <team_slug> -u <username>
```

#### Arguments

- `-o <organization>`: The name of the GitHub organization.
- `-g <team_slug>`: The slug of the team to which the user will be added.
- `-u <username>`: The GitHub username of the user to be added.

#### Example

```bash
./add_user_to_group.sh -o my-org -g my-team -u johndoe
```

### `batch_add_users_to_groups.sh`

This script adds multiple users to specified teams within an organization based on a CSV file.

#### Usage

```bash
./batch_add_users_to_groups.sh -o <organization> -f <file>
```

#### Arguments

- `-o <organization>`: The name of the GitHub organization.
- `-f <file>`: The path to the CSV file containing username and team slug pairs.

#### CSV File Format

The CSV file should contain one username and team slug pair per line, separated by a comma:

```
username1,team_slug1
username2,team_slug2
username3,team_slug3
```

#### Example

Create a CSV file `user_teams.csv` with the following content:

```
johndoe,my-team
janedoe,another-team
```

Run the script:

```bash
./batch_add_users_to_groups.sh -o my-org -f user_teams.csv
```

## Setup

1. Clone the repository:

    ```bash
    git clone https://github.com/Fermain/gh-team-bulk-add.git
    cd github-team-membership-scripts
    ```

2. Make the scripts executable:

    ```bash
    chmod +x add_user_to_group.sh
    chmod +x batch_add_users_to_groups.sh
    ```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## Acknowledgements

- [GitHub CLI](https://cli.github.com/)

## Contact

For questions or feedback, please contact [your-email@example.com](mailto:your-email@example.com).

By including the `chmod` command in the setup instructions, you make it clear to users that they need to set the scripts as executable before running them. This helps ensure a smooth user experience.