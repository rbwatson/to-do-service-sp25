# Understanding Git history: rebasing vs. merging

<!-- vale Google.WordList = NO -->

A Git repository tells the story of your code's evolution over time.
Each commit represents a chapter in that story, building upon previous work. When collaborating with others, you can integrate changes from `main` into your feature branch by _rebasing_ and _merging_.

<!-- vale Google.WordList = YES -->

## The conceptual difference

**Merge commits** bundle your commits in the feature branch together with updates to `main` into a single new commit.
This creates a branch in the project history that later rejoins the main timeline.
This accurately represents the changes made to the feature branch, but it can also make the repository history more complex to follow.

**Rebasing** relocates your commits in the feature branch to appear after the current commits in `main`.
After the rebase, your commits appear as if you had started your work from the current version of `main`.
Your changes remain separate commits, but moved to a new starting point. This maintains a clean, linear history in `main`.

## Why linear history matters

A linear history free of merge commits offers two key benefits:

- **Enhanced readability**: The project history becomes a straightforward chronological sequence.

- **Improved collaboration**: Everyone working in the repository shares the exact same `main` branch timeline.
The maintainer applies feature changes in sequence.
This reduces integration complexity and makes future maintenance simpler.

The following guide walks you through the rebase process.

## Git rebase: a visual how-to

Before you can rebase a feature branch, you need to create a feature branch.

### Starting point

After you create a feature branch, your repository (repo) has this branch structure:

```text
main:     A---B
               \
feature:        B
```

While the illustration makes it look like your feature branch starts with commit `B`,
your feature branch is really an exact copy of the main branch up to and including commit `B`.
For simplicity, commit `A` and earlier commits are generally not shown in the feature branch.

As you develop your feature, or update your docs, you make changes in your feature branch and save them in commits `D` and `E`. Your repo now looks like this:

```text
main:     A---B
               \
feature:        B---D---E
```

As you work on your feature branch, someone else adds commit `C` to `main`.
You sync your fork and your clone, and your repo now looks like this:

```text
main:     A---B---C
               \
feature:        B---D---E
```

Where:

- A, B, C are commits on `main`
- D, E are your new commits to the feature branch

### Rebasing your feature branch

Before your feature branch in this example can merge with `main`, you must first make it current with `main`.
This section describes how to rebase your feature branch using GitHub Desktop on MacOS and Windows. The instructions for using merge branches aren't included in this topic.
Creating merge branches is the default process to update a feature branch, so detailed directions to do that aren't necessary.

#### Rebase using GitHub Desktop on macOS

<!-- vale Google.Ellipses = NO -->
<!-- vale Google.Will = NO -->

1. **Switch to your feature branch**
   - In the top branch dropdown, choose your feature branch

2. **Choose to rebase**
    - From the **Branch** menu, choose **Rebase Current Branch...**.
    - You could also choose `main` in the list of branches, right-click and choose **Rebase Current Branch onto main** to do the same thing.
    - The dialog displays a message that describes how the process adds the changes from one branch to another.
    - **IMPORTANT**: You want to see a message to the effect that, "This will update **\<feature branch\>** by applying its **X commits** on top of **main**"
    - **If you don't see such a message, cancel the operation and start over.**

3. **Resolve conflicts, if any**
   - If conflicts occur, GitHub Desktop shows a **Resolve Conflicts** dialog
   - For each file with conflicts:
     - Click on the file to open it in your default text editor
     - Look for the conflict markers: `<<<<<<<`, `=======`, `>>>>>>>`
     - Edit the file to resolve the conflict by choosing the version that you want to be in the file after the rebase completes.
     - Save the file
     - Back in GitHub Desktop, choose **Mark File as Resolved**, if it isn't checked already
   - After resolving all conflicts, click **Continue Rebase**
   - Repeat this process for each commit with conflicts

4. **Finish the rebase**
   - After you resolve all conflicts, the rebase operation completes automatically
   - If you want to push your rebased branch, you'll need to force push:
     - Click **Push origin** in the top right
     - When prompted about divergent histories, choose **Force push with lease**
     - Note: GitHub Desktop automatically uses **Force push with lease**, which is safer than a standard force push because it checks that you're not overwriting others' work

<!-- vale Google.Ellipses = YES -->
<!-- vale Google.Will = YES -->

#### Using GitHub Desktop on Windows

The workflow is nearly identical to macOS with these minor differences:

- The keyboard shortcuts may differ: `Ctrl` vs. `Command` on macOS, for example
- You access the context menu by using a right-click instead of the macOS' Ctrl+click
- Dialog layouts could differ
- The default text editor could differ

#### Visual result of branch status

After completing the rebase:

```text
main:     A---B---C
                   \
feature:            C---D'---E'
```

Where D' and E' are the commits from your feature branch  after the rebase process replays them on the current `main` branch and assigned new commit hashes.

#### After merging a rebased branch

After completing the rebase, your feature branch looks like this, relative to `main`:

```text
main:     A---B---C
                  \
feature:           C---D'---E'
```

Then, you squash the new commits in your feature branch:

```text
main:     A---B---C
                   \
feature:            C---F'
```

Squashing commits `D'` and `E'` together to make a single commit, `F'`.

You're then ready to create a pull request from your feature branch. When a maintainer merges your pull request into main, they add commit `F'` to the main branch, as shown here.

```text
main:     A---B---C-------F'
                   \     /
feature:            C---F'
```

Because commit `F'` comes from a current version of `main`, the only commit added to `main` in the merge is `F'`.

## More about the differences between using rebase and merge commits

This section reviews in greater detail the differences between using rebase and using merge commits.

### History structure

- **Rebase**: Creates a linear history by rewriting the feature branch commits
- **Merge**: Preserves the original feature branch history and creates a new merge commit

### Commit hashes

- **Rebase**: Updates the commits in the feature branch and assigns new hashes. In this case, `D` becomes `D'`, `E` becomes `E'`
- **Merge**: Preserves original commit hashes in the feature branch

### Conflict resolution

- **Rebase**: Resolves conflicts commit-by-commit as the process replays each of your commits in the feature branch in the context of the current `main` branch
- **Merge**: Resolves all conflicts in one step during the merge by creating a merge commit

### When to use each approach

In class, use rebase to keep your feature branch current for the reasons listed here.
At the same time, it's important to understand when a merge commit might be more suitable to your situation.

#### Use rebasing when

- You want a clean, linear project history, perhaps to have an audit trail of changes
- You're working on a personal feature branch not shared with others and a linear history isn't important
- You want to ensure your feature works with the latest changes to `main` before merging

#### Use merge commits when

- You want to preserve the exact history of the feature branch
- You share the feature branch with other developers
- You want the ability to see where and when you integrated a feature branch

## Best practices

### For rebasing

- Never rebase shared branches, unless you coordinate this with your team
- After rebasing a feature branch, GitHub Desktop prompts you to force push
- **Force push safety**: GitHub Desktop uses **Force push with lease** by default, which is safer than a standard force push because:
    - It checks that you're not accidentally overwriting some existing work
    - It stops the push operation if someone else has updated the remote branch
    - This prevents unintentional deletion of teammates' commits
- Consider practicing rebasing on personal branches before trying it on important shared repositories

### For merge commits

- Use meaningful commit messages for merge commits. You can edit the default message in GitHub Desktop to remind you.
- Review the changes from the other branch, most likely the `main` branch, before completing the merge
- Remember that merging preserves commit history, making it safer for shared branches

## Common GitHub Desktop operations

These are some common operations that you can use in GitHub Desktop to see more details
about the branches in your repo.

### Rebase operations

- **View history**: After rebasing, use the **History** tab to verify the linear history
- **Publish/push**: After rebasing, you'll need to force push (GitHub Desktop prompts you)
- **Abort rebase**: If things go wrong, you can stop the rebase process by clicking **Abort Rebase** in the in-progress dialog
- **Check branch status**: Use the **Fetch origin** button to check if `main` has new changes before rebasing

### Merge operations

- **View history**: After merging, check the **History** tab to see the merge commit with more than one parent
- **Publish/push**: Regular push is all you need for merges, no force push is necessary
- **Abort merge**: You can stop an in-progress merge by clicking **Abort Merge** in the conflict resolution dialog
- **Edit commit message**: You can edit the default merge commit message before finalizing the merge
