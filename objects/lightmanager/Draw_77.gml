if (surface_exists(application_surface))
{
    draw_surface(application_surface, 0, 0);
}

if (surface_exists(light_surface))
{
    draw_surface_stretched(light_surface, 0, 0, window_get_width(), window_get_height());
}
