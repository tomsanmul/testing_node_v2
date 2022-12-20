const callback = require('../initial-test/callback');

test('Test mocking callback function', () => {

    const mockCallback = jest.fn(x => 42 + x);
    callback.forEach([0, 1], mockCallback);

// The mock function is called twice
    expect(mockCallback.mock.calls.length).toBe(2);
// The first argument of the first call to the function was 0
    expect(mockCallback.mock.calls[0][0]).toBe(0);
// The first argument of the second call to the function was 1
    expect(mockCallback.mock.calls[1][0]).toBe(1);
// The return value of the first call to the function was 42
    expect(mockCallback.mock.results[0].value).toBe(42);
// The mock function was called at least once
    expect(mockCallback).toHaveBeenCalled();
// The mock function was called at least once with the specified args
    expect(mockCallback).toHaveBeenCalledWith(0);
    expect(mockCallback).toHaveBeenCalledWith(1);
// The last call to the mock function was called with the specified args
    expect(mockCallback).toHaveBeenLastCalledWith(1);
// The mock function was called at least once
    expect(mockCallback.mock.calls.length).toBeGreaterThan(0);
// The last call to the mock function was called with the specified args
    expect(mockCallback.mock.calls[mockCallback.mock.calls.length - 1]).toEqual([
        1
    ]);
// The first arg of the last call to the mock function was 1
    expect(mockCallback.mock.calls[mockCallback.mock.calls.length - 1][0]).toBe(1);
// A snapshot will check that a mock was invoked the same number of times,
    expect(mockCallback.mock.calls).toEqual([[0], [1]]);

    mockCallback.mockReturnValueOnce(42).mockReturnValueOnce(43);
});

