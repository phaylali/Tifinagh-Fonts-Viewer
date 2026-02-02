import os
import json

def generate_fonts_json():
    fonts_dir = 'Fonts'
    fonts_data = {}

    for root, dirs, files in os.walk(fonts_dir):
        for file in files:
            if file.lower().endswith(('.ttf', '.otf')):
                path = os.path.join(root, file)
                name = os.path.splitext(file)[0].replace('-', ' ').replace('_', ' ')
                # Handle cases like "Font-Regular" or "Font_Regular"
                family = name.replace(' ', '')
                ext = file.split('.')[-1].lower()
                
                if name not in fonts_data:
                    fonts_data[name] = {
                        "name": name,
                        "family": family,
                        "formats": {}
                    }
                fonts_data[name]["formats"][ext] = path

    # Convert dict to list
    font_list = list(fonts_data.values())
    # Sort by name
    font_list.sort(key=lambda x: x['name'])

    # Ensure the assets directory exists before writing the file
    assets_dir = 'assets'
    if not os.path.exists(assets_dir):
        os.makedirs(assets_dir)

    with open(os.path.join(assets_dir, 'fonts.json'), 'w') as f:
        json.dump(font_list, f, indent=2)

    print(f"Successfully generated assets/fonts.json with {len(font_list)} unique fonts.")

if __name__ == "__main__":
    generate_fonts_json()
