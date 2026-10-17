"""
Setup configuration for AI Infrastructure Engineer Learning Path.
"""

from setuptools import setup, find_packages
from pathlib import Path

this_directory = Path(__file__).parent
long_description = (this_directory / "README.md").read_text()

setup(
    name="ai-infra-engineer-learning",
    version="0.1.0",
    author="AI Infrastructure Learning",
    description="Comprehensive learning path for AI Infrastructure Engineers",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/ai-infra-curriculum/ai-infra-engineer-learning",
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Education",
        "Topic :: Education",
        "Topic :: Scientific/Engineering :: Artificial Intelligence",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3.11",
        "Programming Language :: Python :: 3.12",
    ],
    python_requires=">=3.11",
    install_requires=[
        "torch>=2.1.0",
        "fastapi>=0.104.1",
        "uvicorn>=0.24.0",
    ],
)
