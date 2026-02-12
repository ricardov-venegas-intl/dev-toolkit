# dev-toolkit

Collection of reusable developer utilities: prompts, scripts, coding-style guidance, and editor support files for improving productivity and consistency across projects.

## Contents
- `AI/` — prompts and prompt-engineering assets used by internal tooling.
- `CSharp/` — C# coding style guidance and `.editorconfig` for formatter/analyzer rules.
- `Scripts/` — small automation scripts and helpers.

## Quick start
1. Clone the repository: `git clone <repo>`
2. Configure your editor to respect `.editorconfig` (Visual Studio, VS Code, Rider).
3. Follow the coding rules in `CSharp/coding-style.md` when contributing C# code.

Note: for stricter static analysis enable `StyleCop.Analyzers` and turn on nullable reference checks (`<Nullable>enable</Nullable>`) in your project files — `CSharp/.editorconfig` contains recommended analyzer settings.

## Contributing
Pull requests are welcome. Please keep changes small, include tests where applicable, and follow the repository's coding-style rules.

## License
This project is licensed under the MIT License — see the `LICENSE` file for details.
