import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
  await page.goto('https://www.google.ch/');
  await page.getByRole('button', { name: 'Alle akzeptieren' }).click();
  await page.locator('div').filter({ hasText: 'Wähle aus, wozu du Feedback geben möchtestMehrLöschenLöschen Google Suche Auf' }).nth(3).click();
  await page.getByLabel('Suche', { exact: true }).click();
  await page.getByLabel('Suche', { exact: true }).fill('digitec');
  try {
    await page.goto('https://www.google.ch/search?q=digitec', { waitUntil: 'domcontentloaded' });
  } catch (error) {
    console.error('Failed to navigate to the URL:', error);
  }
  await page.goto('https://www.digitec.ch/');
  await page.getByPlaceholder('Wonach suchst du?').click();
  await page.getByPlaceholder('Wonach suchst du?').fill('laptop');
  await page.getByPlaceholder('Wonach suchst du?').press('Enter');
  await page.locator('#blur_container').click();
});