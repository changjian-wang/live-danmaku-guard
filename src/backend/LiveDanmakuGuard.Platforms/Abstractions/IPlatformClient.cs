namespace LiveDanmakuGuard.Platforms.Abstractions;

/// <summary>
/// Interface for platform-specific clients (Bilibili, Douyin, etc.)
/// </summary>
public interface IPlatformClient
{
    /// <summary>
    /// Platform name (e.g., "Bilibili", "Douyin")
    /// </summary>
    string PlatformName { get; }

    /// <summary>
    /// Connect to a live room
    /// </summary>
    Task ConnectAsync(string roomId, CancellationToken cancellationToken = default);

    /// <summary>
    /// Disconnect from current room
    /// </summary>
    Task DisconnectAsync(CancellationToken cancellationToken = default);

    /// <summary>
    /// Check if currently connected
    /// </summary>
    bool IsConnected { get; }

    /// <summary>
    /// Event fired when a danmaku message is received
    /// </summary>
    event EventHandler<DanmakuReceivedEventArgs>? DanmakuReceived;

    /// <summary>
    /// Event fired when connection state changes
    /// </summary>
    event EventHandler<ConnectionStateChangedEventArgs>? ConnectionStateChanged;
}

/// <summary>
/// Event args for danmaku received event
/// </summary>
public class DanmakuReceivedEventArgs : EventArgs
{
    public string UserId { get; set; } = string.Empty;
    public string Username { get; set; } = string.Empty;
    public string Message { get; set; } = string.Empty;
    public DateTime Timestamp { get; set; }
    public Dictionary<string, object> Metadata { get; set; } = new();
}

/// <summary>
/// Event args for connection state changed event
/// </summary>
public class ConnectionStateChangedEventArgs : EventArgs
{
    public bool IsConnected { get; set; }
    public string? Reason { get; set; }
}
