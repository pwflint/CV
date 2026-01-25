# Deployment Migration Plan: GitHub → GitLab

## Current State

### Primary Repository: GitHub (origin)
- **Deployment**: GitHub Pages via GitHub Actions
- **Workflow**: `.github/workflows/pages.yml`
- **Sync**: Manual push to GitLab (hill-st) when needed
- **Auto-sync**: `.github/workflows/sync-to-gitlab.yml` (to be configured)

### Secondary Repository: GitLab (hill-st)
- **Deployment**: GitLab Pages (configured but not primary)
- **Workflow**: `.gitlab-ci.yml` (alternative deployment option)
- **Status**: Protected main branch, receives syncs from GitHub

## Migration Goal

Switch primary deployment to GitLab Pages, making:
- **GitLab (hill-st)** → Primary repository and deployment
- **GitHub (origin)** → Backup/sync repository

## Steps Required

### 1. Update GitLab CI/CD Configuration
- [ ] Review and finalize `.gitlab-ci.yml` for GitLab Pages deployment
- [ ] Ensure build and deploy stages are properly configured
- [ ] Test GitLab Pages deployment on a feature branch
- [ ] Verify all assets (images, CSS, JS) deploy correctly

### 2. Update Remote Configuration
- [ ] Change local git remotes:
  ```bash
  git remote rename origin github-backup
  git remote rename hill-st origin
  ```
- [ ] Update branch tracking to point to new origin (GitLab)
- [ ] Verify remote configuration: `git remote -v`

### 3. Reverse Sync Workflow
- [ ] Create new workflow: `.gitlab-ci.yml` sync job (or separate pipeline)
- [ ] Set up GitLab CI/CD to push to GitHub on successful deployments
- [ ] Configure GitHub personal access token or deploy key as GitLab CI/CD variable
- [ ] Test sync from GitLab → GitHub

### 4. Update Documentation
- [ ] Update `README.md` to reflect GitLab as primary deployment
- [ ] Update deployment instructions
- [ ] Document new workflow (GitLab → GitHub sync)
- [ ] Update any references to GitHub Pages

### 5. GitHub Actions Cleanup
- [ ] Remove or disable `.github/workflows/sync-to-gitlab.yml` (no longer needed)
- [ ] Keep `.github/workflows/pages.yml` for reference or remove if not needed
- [ ] Consider archiving GitHub Pages deployment workflow

### 6. GitLab Pages Configuration
- [ ] Enable GitLab Pages in repository settings
- [ ] Configure custom domain (if applicable)
- [ ] Set up SSL/TLS certificate
- [ ] Test deployment and verify site is accessible

### 7. Migration Execution
- [ ] Push current main branch to GitLab (if not already synced)
- [ ] Merge any pending PRs on GitHub first
- [ ] Create final sync from GitHub → GitLab
- [ ] Switch remotes locally
- [ ] Update any CI/CD variables or secrets
- [ ] Deploy to GitLab Pages
- [ ] Verify deployment works correctly

### 8. Post-Migration
- [ ] Update GitHub repository description/README to indicate it's a mirror
- [ ] Test the reverse sync (GitLab → GitHub)
- [ ] Monitor first few deployments to ensure sync works
- [ ] Update any external links/bookmarks to point to GitLab Pages URL

## GitLab CI/CD Sync Configuration

### Option A: Add sync job to existing `.gitlab-ci.yml`
```yaml
sync_to_github:
  stage: deploy
  image: alpine:latest
  before_script:
    - apk add --no-cache git openssh-client
    - mkdir -p ~/.ssh
    - echo "$GITHUB_SSH_PRIVATE_KEY" | tr -d '\r' > ~/.ssh/id_rsa
    - chmod 600 ~/.ssh/id_rsa
    - ssh-keyscan github.com >> ~/.ssh/known_hosts
  script:
    - git remote add github git@github.com:pwflint/CV.git || true
    - git push github ${CI_COMMIT_REF_NAME} || true
  only:
    - main
  when: on_success
```

### Option B: Separate sync pipeline
- Create dedicated sync job that runs after successful Pages deployment
- Use GitLab CI/CD variables for GitHub credentials
- Configure to run only on main branch deployments

## Considerations

### Branch Protection
- GitLab main branch is protected (cannot force push)
- Will need to use merge requests for all changes
- GitHub can remain less restricted as backup

### Deployment URLs
- Update any hardcoded URLs or references
- GitLab Pages URL format: `https://[namespace].gitlab.io/[project-name]`
- Or custom domain if configured

### Secrets Management
- Move GitHub-related secrets to GitLab CI/CD variables
- Set up GitHub personal access token or deploy key
- Store securely in GitLab's variable management

### Rollback Plan
- Keep GitHub Actions workflow files for quick rollback if needed
- Document how to switch back if issues arise
- Maintain ability to deploy from either platform during transition

## Timeline Recommendation

1. **Phase 1**: Set up and test GitLab Pages deployment (1-2 days)
2. **Phase 2**: Configure reverse sync workflow (1 day)
3. **Phase 3**: Update remotes and documentation (1 day)
4. **Phase 4**: Execute migration and verify (1 day)
5. **Phase 5**: Monitor and adjust (ongoing)

## Notes

- LICENSE file: Currently only on GitLab, should be added to GitHub during migration
- Current workflow files can be kept for reference
- Consider keeping both deployment methods active during transition period
- Test thoroughly before making GitLab the primary
