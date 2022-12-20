const sum = require('../initial-test/initial-test');

test('adds 1 + 2 to equal 3', () => {
    expect(sum(1, 2)).toBe(3);
});

test('If any parameter is empty, it fails.', () => {
    expect(sum("", "")).toBe(false);
});

test('If we pass characters in any of the parameters, it fails', () => {
    expect(sum("dog", "cat")).toBe(false);
});

test('If any parameter is negative, it fails.', () => {
    expect(sum(-2, -5)).toBe(false);
});




