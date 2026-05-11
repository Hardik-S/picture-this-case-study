# Picture This! Case Study

Public-safe product leadership artifact for the Picture This! resume claim. The repo presents the work as a sanitized case study and lightweight static prototype, not as a dump of private teammate, investor, or course material.

## Recruiter Proof Point

This first proof pass establishes:

- a static case-study page in `index.html`
- a focused product narrative in `docs/case-study.md`
- explicit privacy and evidence boundaries in this README
- a static verifier in `scripts/verify-static-site.ps1`
- a Vercel-ready static configuration in `vercel.json`

## Publication Boundaries

Included:

- problem framing
- product decisions
- testing loop
- synthetic prototype screens
- leadership lessons

Excluded:

- teammate names and private contact details
- investor-specific notes
- proprietary pitch-deck material
- unverified traction claims
- private application strategy

## Local Preview

Open `index.html` directly in a browser or run a local static server:

```powershell
python -m http.server 4173
powershell -NoProfile -ExecutionPolicy Bypass -File scripts\verify-static-site.ps1
```

## File Structure

- `index.html`: recruiter-facing static case-study page.
- `styles.css`: visual system and responsive layout.
- `docs/case-study.md`: decision rationale and rejected approaches.
- `vercel.json`: static deploy routing.

