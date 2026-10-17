# Contributing to AI Infrastructure Engineer Learning

Thank you for your interest in contributing! This document provides guidelines for contributing to the curriculum.

## 🎯 Ways to Contribute

### 1. Report Issues
- Typos or errors in documentation
- Code bugs or issues
- Broken links
- Outdated information
- Confusing explanations

### 2. Suggest Improvements
- Additional exercises
- Better examples
- New resources
- Updated best practices
- Alternative approaches

### 3. Add Content
- New exercises with solutions
- Additional examples
- Quiz questions
- Project ideas
- Documentation improvements

### 4. Share Projects
- Your implementations of projects
- Creative variations
- Production deployments
- Case studies

## 📝 Contribution Process

### Quick Fixes (Typos, Links, etc.)

1. **Fork the repository**
   ```bash
   # Click "Fork" on GitHub
   git clone https://github.com/YOUR_USERNAME/ai-infra-engineer-learning.git
   cd ai-infra-engineer-learning
   ```

2. **Create a branch**
   ```bash
   git checkout -b fix/typo-in-module-01
   ```

3. **Make your changes**
   - Fix the issue
   - Test if applicable

4. **Commit and push**
   ```bash
   git add .
   git commit -m "Fix typo in Module 01 README"
   git push origin fix/typo-in-module-01
   ```

5. **Create Pull Request**
   - Go to GitHub and create PR
   - Describe your changes
   - Link related issues if any

### Larger Contributions (New Content)

1. **Discuss first** - Open an issue to discuss your idea
2. **Get feedback** - Ensure it aligns with curriculum goals
3. **Follow format** - Match existing structure and style
4. **Include tests** - If adding code, include tests
5. **Update docs** - Update relevant documentation
6. **Submit PR** - Create pull request with clear description

## 📐 Style Guidelines

### Documentation

- **Use clear, concise language**
- **Include examples** for complex concepts
- **Add code comments** explaining WHY, not just WHAT
- **Follow Markdown best practices**
- **Use proper heading hierarchy**

### Code

```python
# ✅ Good: Clear, commented, follows TODO pattern
def train_model(config: ModelConfig) -> TrainedModel:
    """
    Train ML model with given configuration.

    Args:
        config: Model configuration object

    Returns:
        Trained model ready for evaluation

    TODO:
    1. Load training data
    2. Initialize model architecture
    3. Set up optimizer and loss function
    4. Train for specified epochs
    5. Save checkpoints
    6. Return trained model
    """
    # TODO: Implement training logic
    pass


# ❌ Avoid: No docs, no guidance
def train(c):
    pass
```

### File Organization

```
# For new exercises:
lessons/XX-module-name/
├── exercises/
│   ├── exercise-01-name.md      # Problem statement
│   ├── exercise-01-starter.py   # Starter code with TODOs
│   └── solutions/
│       └── exercise-01-solution.py  # Full solution

# For new documentation:
- Use clear, descriptive filenames
- Keep related content together
- Update parent README to link to new content
```

## 🧪 Testing Contributions

Before submitting:

1. **Test code changes**
   ```bash
   # If you added/modified code:
   pytest tests/
   ```

2. **Verify links**
   - Check all links work
   - Verify code examples run
   - Test any shell commands

3. **Check formatting**
   ```bash
   # Python code
   black src/
   flake8 src/
   ```

## 📋 Pull Request Template

When creating a PR, include:

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Example/exercise addition

## Checklist
- [ ] Code follows style guidelines
- [ ] Documentation updated
- [ ] Tests added/updated
- [ ] All tests pass
- [ ] Links verified

## Related Issues
Closes #123
```

## 🏆 Recognition

Contributors will be:
- Listed in CONTRIBUTORS.md
- Mentioned in release notes
- Credited in modified files

## 🚫 What We Don't Accept

- **Solutions to graded assessments** - We want learners to solve these independently
- **Copyrighted material** - Only original content or properly licensed material
- **Off-topic content** - Must relate to AI infrastructure engineering
- **Marketing/promotional content** - No spam or self-promotion

## 📚 Resources for Contributors

### Curriculum Standards

- **Learning objectives** - Each lesson/project must have clear objectives
- **Progressive difficulty** - Build on previous content
- **Real-world relevance** - Connect to industry practices
- **Hands-on focus** - Emphasize practical implementation

### Content Templates

Content templates (exercise, project, documentation) are planned. For now, model new contributions on an existing high-quality example:

- New exercise: copy the structure of `lessons/mod-101-foundations/exercises/exercise-01-environment-setup.md`
- New project: model on `projects/project-101-basic-model-serving/README.md`
- New lecture note: model on any file under `lessons/mod-1*-*/lecture-notes/`

### Style Guides

- [Python Style Guide](https://peps.python.org/pep-0008/)
- [Markdown Style Guide](https://www.markdownguide.org/basic-syntax/)
- [Documentation Best Practices](https://www.writethedocs.org/guide/)

## ❓ Questions?

- **General questions**: [GitHub Discussions](https://github.com/ai-infra-curriculum/ai-infra-engineer-learning/discussions)
- **Contribution questions**: Open an issue with "Question:" prefix
- **Email**: ai-infra-curriculum@joshua-ferguson.com

## 🙏 Thank You!

Every contribution, no matter how small, helps make this curriculum better for everyone. We appreciate your time and effort!

---

**Ready to contribute?** [Open an issue](https://github.com/ai-infra-curriculum/ai-infra-engineer-learning/issues/new) or [start a discussion](https://github.com/ai-infra-curriculum/ai-infra-engineer-learning/discussions)!
