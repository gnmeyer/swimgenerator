const config = {
    branches: ['main'],
    dryRun: false,
    debug: false,
    plugins: [
      '@semantic-release/commit-analyzer',
      {
        "preset": "conventionalcommits"
      },
      '@semantic-release/release-notes-generator',
      '@semantic-release/github',
    ],
    repositoryUrl: "https://github.com/gnmeyer/swimgenerator",
  }
  module.exports = config;