## Follow Git Branching Strategy.

### Description

### This setup aims to streamline development processes, facilitate continuous integration and delivery (CI/CD), and ensure that production code is stable and reliable. Here's a detailed explanation of each branch type and how they interact within this workflow:

````
Master Branch

Purpose: Acts as the main branch where the source code's current working version is maintained. It should be stable and deployable at any time.

Usage: Rarely directly committed to; instead, changes are merged from Dev, Release, and Hotfix branches.
````
Dev Branch
Purpose: Serves as the primary development branch where all feature branches merge back into. This is where ongoing work gets integrated, tested, and reviewed before being considered for release.

Usage: Developers merge feature branches into Dev for integration testing. Once stable, changes in Dev move to a Release branch for further stabilization.

Feature Branches
Purpose: Used by developers to work on new features or bug fixes. Each feature branch corresponds to a single feature or fix, allowing for focused development without affecting the main or development branches.

Usage: Branch off from Dev, work on the feature, and once complete, merge back into Dev for integration.

Release Branches
Purpose: Prepares for a new product release. This branch allows for minor bug fixes, documentation generation, and other release-oriented tasks without impacting ongoing development in the Dev branch.

Usage: Branch off from Dev when the features for the next release are complete and stable. Once the release is ready, it merges into Master and Dev, and a tag is created to mark the release version.

Hotfix Branches
Purpose: Provides a quick way to fix critical bugs in the production version of the software.

Usage: Branch off from Master, fix the issue, and then merge back into both Master and Dev. Like Release branches, a tag is created after merging to Master to indicate the new version.

GitHub Production Branches [Preprod - Prod]
Preprod (Preproduction) Branch: Serves as the final staging area for code before it goes into production. This is where final testing occurs, mimicking the production environment as closely as possible.

Prod (Production) Branch: Reflects the codebase currently in production. It should only ever receive merges from Preprod or Release branches to ensure stability.

Workflow Summary
Development: Work is done in Feature branches, which merge back into Dev.

Release Preparation: When ready, changes in Dev move to a Release branch for final adjustments and then to Master.

Hotfixes: Critical fixes are made in Hotfix branches and merged into both Master and Dev.

Production Deployment: Master is merged into Preprod for final testing. After approval, Preprod merges into Prod to update the production environment.

 

 

Merging code between two GitHub accounts, especially from a development environment in one account (Dev) to a production environment in another account (Prod), involves a process that ensures code changes are properly reviewed, tested, and then deployed. This process can be achieved through the use of pull requests, but since GitHub doesn't directly support cross-account pull requests in the same way it does within the same repository or between forks within the same account, you would typically follow a process involving forking, pushing, and then creating pull requests or directly pushing to a branch, depending on your access levels and workflow preferences. Here’s a general approach to achieve this:

1. Forking or Mirroring the Repository (If Necessary)
Forking: If you have write access to the Prod account but not direct branch creation or merging capabilities, you might fork the repository from the Dev account to the Prod account. This method is more common for open-source projects or scenarios where developers contribute without full access.

Mirroring: For continuous synchronization between Dev and Prod repositories (across accounts), setting up a mirror of the Dev repository in the Prod account could be beneficial. Mirroring ensures that the Prod repository automatically updates with the Dev repository's changes.

2. Pushing Changes from Dev to Prod
With Fork: If you've forked the Dev repository to your Prod account, you can synchronize the changes by fetching the updates from the original Dev repository and merging them into your forked repository's corresponding branch. Then, you can submit a pull request from your fork (Prod account) back to the original repository (Dev account) if you want to contribute changes upstream, or simply keep the fork updated for deployment purposes.

Without Fork (Direct Push): If you have direct push access to both the Dev and Prod repositories (even across different accounts), you can clone the repository from the Dev account, create a local branch to hold your changes, push this branch to the Prod repository, and then create a pull request within the Prod account's repository or directly merge the changes if you have the necessary permissions.

3. Creating a Pull Request in the Prod Account
Once the changes are in a branch of the Prod account's repository (either through a fork or direct push), you can open a pull request within the Prod account to merge the changes into the main branch (or any other target branch designated for production releases). This pull request can be reviewed, tested, and eventually merged by those with the appropriate permissions in the Prod account.

4. Deployment
After the pull request is merged into the production branch in the Prod account, you can deploy the changes to your production environment following your usual deployment process, whether that's through manual deployment, continuous integration (CI), or continuous deployment (CD) pipelines.

