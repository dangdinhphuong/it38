import { defineConfig, devices } from '@playwright/test';

export default defineConfig({
  testDir: './',
  testMatch: '**/*.spec.ts',
  timeout: 30000,
  expect: {
    timeout: 5000,
  },
  fullyParallel: false, // Run sequentially to avoid DB concurrency collisions on shared test accounts
  workers: 1,
  reporter: [
    ['list'],
    ['json', { outputFile: 'test-results/results.json' }],
    ['html', { open: 'never' }]
  ],
  use: {
    baseURL: process.env.BASE_URL || 'http://localhost:5017',
    trace: 'retain-on-failure',
    screenshot: 'only-on-failure',
    video: 'off',
  },
  projects: [
    {
      name: 'chromium',
      use: { ...devices['Desktop Chrome'] },
    },
  ],
});
