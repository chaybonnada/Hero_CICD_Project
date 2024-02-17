import requests

def get_new_commits(username, repository):
    url = f'https://api.github.com/repos/{username}/{repository}/commits'

    response = requests.get(url)

    if response.status_code == 200:
        commits = response.json()
        return commits
    else:
        print(f"Failed to fetch commits. Status code: {response.status_code}")
        return None

def main():
    username = 'username'
    repository = 'git_assignment_HeroVired'

    commits = get_new_commits(username, repository)

    if commits:
        print(f"New commits in {username}/{repository}:")
        for commit in commits:
            print(f"Commit: {commit['sha'][:7]} by {commit['commit']['author']['name']}: {commit['commit']['message']}")
    else:
        print("No new commits.")

if __name__ == "__main__":
    main()
