using Microsoft.Extensions.Logging;
using Microsoft.Maui.Controls.Compatibility.Hosting;
namespace Lab2;

public static class MauiProgram
{
	public static MauiApp CreateMauiApp()
	{
		var builder = MauiApp.CreateBuilder();
		builder
			.UseMauiApp<App>()
			.UseMauiCompatibility()
			.ConfigureFonts(fonts =>
			{
				fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
				fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                fonts.AddFont("WIDEAWAKEBLACK.ttf", "WIDEAWAKEBLACK");
            })
            .ConfigureMauiHandlers((handlers) => {
#if ANDROID
			handlers.AddHandler(typeof(Lab2.Controls.BorderedEntry),typeof(Lab2.Platforms.Android.Renderers.BorderedEntryRenderer));
#endif
            });

#if DEBUG
        builder.Logging.AddDebug();
#endif
		return builder.Build();
	}
}


