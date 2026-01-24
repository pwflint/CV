# Curriculum Vitae for Peter W Flint

This is a repository for my personal web-based CV. All information contained herein is public, but please consider it's personal nature if using it for any reason.

# CV Website

A static website version of my curriculum vitae, built with HTML and CSS.

## Recent Changes

### Completed Tasks
- [x] Converted from Jekyll to static HTML/CSS
- [x] Improved typography with Mako and Encode Sans fonts
- [x] Updated color scheme to earthy tones with accessibility compliance
- [x] Reorganized content structure
- [x] Added responsive design
- [x] Improved navigation
- [x] Added contact icons in header
- [x] Added KALEIOPE website link in footer
- [x] Removed unnecessary Jekyll dependencies
- [x] Added dark mode support with persistent theme preference
- [x] Optimized image loading with lazy loading
- [x] Added print stylesheet for professional PDF export
- [x] Added PDF export functionality
- [x] Implemented GitHub Actions workflow for GitHub Pages deployment
- [x] Added privacy-friendly analytics tracking

### Current Features
- Clean, modern design
- Responsive layout
- Accessible color scheme
- Easy navigation
- Contact information readily available
- Professional typography
- **Dark mode** with system preference detection and manual toggle
- **Optimized images** with lazy loading for faster page performance
- **Print-optimized** stylesheet for professional PDF generation
- **One-click PDF export** using browser's native print functionality
- **Privacy-friendly analytics** tracking page views and interactions

### Technical Details
- Built with vanilla HTML and CSS
- Uses Font Awesome for icons
- Google Fonts for typography
- Minimal JavaScript for enhanced functionality (dark mode, PDF export, analytics)
- Mobile-first design
- WCAG 2.1 AA compliant
- Lazy loading images for performance
- Print stylesheet for professional output
- GitHub Actions workflow for automated deployment to GitHub Pages

## Deployment

This site is deployed using **GitHub Pages** via GitHub Actions workflow. The deployment is automated through `.github/workflows/pages.yml`.

### Deployment Process
1. Push changes to the `main` branch
2. GitHub Actions automatically validates and builds the site
3. Site is deployed to GitHub Pages
4. Site is available at: `https://[username].github.io/[repository-name]` or your custom domain

### Deployment Configuration
- **Primary**: GitHub Pages (automated via GitHub Actions)
- **Alternative**: GitLab Pages configuration available in `.gitlab-ci.yml` if needed
- **Manual**: Files can be deployed directly to any static hosting service

### GitHub Pages Setup
1. Enable GitHub Pages in repository settings
2. Select source: "GitHub Actions" (not "Deploy from a branch")
3. The workflow will automatically deploy on pushes to `main`

### Manual Deployment
If you need to deploy manually or to a different server:
- Use the files directly (they're static HTML/CSS/JS)
- Upload to any static hosting service (Netlify, Vercel, etc.)
- Configure the GitLab CI/CD pipeline for GitLab Pages (see `.gitlab-ci.yml`)

## Configuration

### Analytics
The analytics script (`analytics.js`) is included but requires configuration:
1. Update `ANALYTICS_ENDPOINT` in `analytics.js` with your analytics service endpoint
2. Set `ENABLE_ANALYTICS` to `true` to enable tracking, or `false` to disable

The analytics script is privacy-friendly:
- No cookies used
- No personal data collected
- Session IDs are memory-only (not persisted)
- Respects user privacy

### Dark Mode
Dark mode preference is stored in `localStorage` and persists across sessions. Users can toggle between light and dark themes using the moon/sun icon in the header.

### PDF Export
Click the "Export as PDF" button to generate a PDF version of the CV. The print stylesheet ensures professional formatting when printing or saving as PDF.

