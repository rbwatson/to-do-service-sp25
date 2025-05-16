# Clean up a feature branch with merge commits

If you have a feature branch that has merge commits, you might be able to clean
it up to end up with a feature branch with a linear history.

The goal is to take your changes that might have intermingled merge commits and place them after, or "on top of" the current `main` branch.
If you have already submitted a pull request, you can try to end up with this organization in the feature branch of your pull request.
In the worst-case scenario, you create a _repaired feature branch_ into which you can save your changes.

## Feature branch clean up: step-by-step

This procedure refers to the following branches.
You probably have different names for them, so be sure to use the actual name of your branch while you follow the procedure.

- **Original feature branch** Your feature branch before you start this procedure, which includes your recent changes and some merge commits.

- **Saved copy branch** A copy of the _original feature branch_ that you make before you start the repair procedure.

- **Repaired feature branch** The finished feature branch with your changes on a current copy of `main` that's ready to use in a pull request at the end of the procedure.
This could be your _original feature branch_ if you repaired it, or it could be a new one that you created from `main`. After you create a new branch or repair the original branch, the procedure steps are the same.

### 0. Sync your fork and clone

Before starting this process, make sure that your fork and your clone are in sync
with the upstream, original repo.

Also, make sure you're using a current version of GitHub Desktop.
Older version don't support this procedure.

**Tip** To check your version, go to **GitHub Desktop** > **About GitHub Desktop** on macOS or **Help** > **About GitHub Desktop** on Windows.
You want to be running GitHub Desktop version 3.1.0 or later to complete this procedure.

### 1. Save a copy of your current feature branch

In your GitHub Desktop app:

<!-- vale Google.Ellipses = NO -->

1. Choose the repository with your feature branch from the **Current repository** list
2. In your repository, choose your feature branch to repair.
    In this exercise, that's the _original feature branch_.
3. In the branch dropdown that you used to select your feature branch, create a new branch from the current branch:

    1. Open the branch dropdown at the top.
    2. Choose **New Branch...**.
    3. Enter a name for your duplicate branch. For example, _saved copy branch_.
    4. Confirm the **Create branch based on** field shows your current feature branch.
    5. Choose **Create Branch**.

You now have a new branch that has the same commit history as your original feature branch has.
This new branch is your back up copy as you continue the repair process.

**Note** If you want to be extra careful, you can make another copy of the branch named `feature-branch-safety-copy`.

### 2. Identify the commits

In your GitHub Desktop app:

1. Confirm that you are using your repository, and the _original feature branch_ that you want to repair.
2. Review the commits in the left column to identify:
    1. Your commits.
    2. The earliest merge commit.
    3. The latest commit from `main` _that precedes the earliest merge commit_.
        You can see which commits are in `main` in a web browser by opening the [commit list in GitHub](https://github.com/UWC2-APIDOC/to-do-service-sp25/commits/main).

At this point, you want to know where your branch started and which commits are yours. Again, keeping the end goal of having your commits and only your commits follow the current version of `main` in your feature branch.

### 3. Reset your original feature branch

At this point, the procedure makes irrevocable changes to your original feature branch.

**Note** If you get tangled up to where you seem to be causing more damage than you are fixing stop and skip to [How to create a _repaired feature branch_ and save your changes](#how-to-create-a-repaired-feature-branch-and-save-your-changes).

#### Open the command line terminal

1. In GitHub Desktop, choose your repository.
2. In Windows, in the menu bar, choose **Repository** > **Open in Command Prompt**.
3. In macOS, in the menu bar, choose **Repository** > **Open in Terminal**.
4. This opens a command or terminal window at your repository’s root directory.

#### Reset the feature branch

1. In GitHub Desktop, in your _original feature branch_ of your repository, in the commit list, choose the last commit from `main` before the first merge commit. This is probably the first commit you saved to the _original feature branch_.
2. In the commit details and comment shown  in the right column, find the shortened hash of the commit, displayed as a 7-digit hexadecimal number.
3. Choose the copy icon to the right of the hash to copy the shortened hash of the commit
4. In the command or terminal window, enter the following command, paste the commit hash you copied from GitHub Desktop to replace `<commit hash>`, and press `Enter`.

    ```bash
    git reset <commit hash>
    ```

After you do this, in GitHub Desktop, you should see the commit list change so that the commit you selected before running the `git reset` command.

### 4. Repair your feature branch

Your _original feature branch_ should have a copy of an old version of `main` at this point.
Before making any more changes, you want to update this branch to the current version of `main` to create a _repaired feature branch_. After you repair the branch, you'll replace your commits.

To rebase the _original feature branch_ after resetting it:

1. Sync your fork and clone.
2. In GitHub Desktop, switch to the _original feature branch_.
    1. At the top of the window, choose the current branch dropdown.
    2. Choose _original feature branch_ from the list of branches.
3. Rebase the _original feature branch_:
    1. In the menu bar, choose **Branch** > **Rebase current branch**.
    2. Choose `main`, which should be the default option.
    3. Review the message and confirm that the operation puts the commits from the _original feature branch_ on top of `main`.
    4. Confirm that the button text is **Rebase**.
        **Note** The **Rebase** option isn't always the default option.
    5. Choose **Rebase**.

You are now on the repaired version of your _original feature branch_, but missing your changes. Use this branch as the _repaired feature branch_ for the remaining steps in which you'll add your changes from the _saved copy branch_ you created earlier.

#### How to create a _repaired feature branch_ and save your changes

If you get tangled up in the process or you aren't sure which commit is which, you can create a _repaired feature branch_ from `main` to use as your _repaired feature branch_ and then cherry-pick your commits into it. To do this:

1. Sync your fork and clone.
2. In GitHub Desktop, switch to the `main` branch.
    1. At the top of the window, choose the current branch dropdown.
    2. Choose `main` from the list of branches.
3. Create a new branch:
    1. In the branch dropdown, choose **New Branch...***.
    2. Enter a name for your _repaired feature branch_.
    3. Confirm that the **Create branch based on** field shows `main`.
    4. Choose **Create Branch**.

You are now on your _repaired feature branch_, but without your changes. Use this branch as the _repaired feature branch_ for the remaining steps in which you'll add your changes from the _saved copy branch_ you created earlier.

### 5. Cherry pick your commits from your saved feature branch

In this step you move your commits from the _saved copy branch_ to your repaired or new _repaired feature branch_.

1. In GitHub Desktop, in your repository, choose your _saved copy branch_. This is the branch you'll cherry-pick your commits from.
2. In the commit list, find the latest commit from `main` _that precedes the earliest merge commit_ that you found earlier.
3. For each of your commits on top of that commit:
    1. Right-click the commit. You can choose more than one commit as long as they're adjacent. Be sure not to choose any merge commits.
    2. Choose **Cherry-pick commit**.
    3. In the dialog that appears, choose your _repaired feature branch_.
    4. Choose **Cherry-pick _X_ commits to _repaired feature branch_**.
    5. Return to the _saved copy branch_ and repeat these steps for each commit you want to move.
4. Review your _repaired feature branch_ to make sure it has all the changes you want to save.

### 6. Squash your commits

<!-- vale Google.Parens = NO -->

At this point, your _repaired feature branch_ should have all your commits on top of the last commit from the current `main`.
You can test this by entering `main` in the compare box at the top of the commit list and it should show **Behind (0)**.

If all looks good, and you have more than one commit on top of `main`, you'll want to _squash_ your commits so that one commit contains all your changes.

#### To squash your commits

1. Open GitHub Desktop and choose your repository.
2. In GitHub Desktop, in your repository, choose your _repaired feature branch_. This is the branch in which you'll squash your commits.
3. Using the pointer, choose the commits that you want to squash into a single commit.
4. Right-click one of the chosen commits, and choose, **Squash _X_ commits**.
5. Update the commit message for the resulting commit, and choose, **Squash _X_ commits**.
6. If there are conflicts, GitHub Desktop prompts you to resolve them before continuing.
7. Review your branch:

After the squash completes, your commit history should show the squashed commits on top of the latest `main`.

### 7. Request a review in your pull request

If you have already created a pull request for your _repaired feature branch_ and you repaired the existing feature branch, go to the pull request and ask for a re-review.

If you created a _repaired feature branch_ to use as your _repaired feature branch_ during this process,
you'll need to close the original pull request and create a new one from the _repaired feature branch_.
Be sure to refer to the original pull request in the comments of your new pull request so that the maintainers can see the entire history of the change.
