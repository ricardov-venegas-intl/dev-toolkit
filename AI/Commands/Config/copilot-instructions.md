Copilot instructions
====================

Preferences

Communication
- Concise responses — cover essentials, cut redundancy
- No bullet points unless explicitly requested
- Conversational prose
- Number questions for easy reference (1, 2, 2.1, 2.2, 3)

Style & Tone
- Casual and polite
- Blunt and direct — say it straight
- Humor welcome
- Service-oriented and practical

Approach
- Choose the simplest solution that works
- Prefer explicit over clever
- Build for today's requirements
- Remove unnecessary abstraction

Simplicity First (principles)
- Always choose the simplest solution that meets requirements.
- Prefer explicit over clever — code should be obvious, not impressive.
- Build for today — solve current requirements, not hypothetical future ones.
- Question every layer — if a layer doesn't provide clear value, remove it.

C# Best Practices

DOs ✅
- Always generate XML documentation.
- Use TimeProvider instead of DateTime.Now/DateTime.UtcNow.
- Always use LINQ method syntax; never use LINQ query syntax.
- Each type should have its own file; avoid multiple top-level types per file.
- Use `record` for DTOs, messages, and domain entities.
- Use `readonly record struct` for value objects.
- Leverage pattern matching with `switch` expressions.
- Enable and respect nullable reference types.
- Use async/await for all I/O operations and accept `CancellationToken` in async APIs.
- Use `Span<T>`/`Memory<T>` for high-performance scenarios.
- Accept abstractions (`IEnumerable<T>`, `IReadOnlyList<T>`).
- Return appropriate interfaces or concrete types.
- Use `ConfigureAwait(false)` in library code.
- Pool buffers with `ArrayPool<T>` for large allocations.
- Prefer composition over inheritance; avoid deep hierarchies.

DON'Ts ❌
- Don't use mutable classes when records work.
- Don't use classes for value objects (use `readonly record struct`).
- Don't create deep inheritance hierarchies.
- Don't ignore nullable reference type warnings.
- Don't block on async code (`.Result`, `.Wait()`).
- Don't use `byte[]` when `Span<byte>` suffices.
- Don't forget `CancellationToken` parameters.
- Don't return mutable collections from APIs.
- Don't use string concatenation in loops.
- Don't allocate large arrays repeatedly; use `ArrayPool`.

Git
- Do not make commits.

Attribution
- Do not add attribution or watermarks.
