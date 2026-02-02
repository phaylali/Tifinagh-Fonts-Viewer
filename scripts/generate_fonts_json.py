import os
import json

def generate_fonts_registry():
    fonts_dir = 'Fonts'
    assets_dir = 'assets'
    registry_file = os.path.join(assets_dir, 'fonts.json')
    
    if not os.path.exists(assets_dir):
        os.makedirs(assets_dir)
        
    font_files = []
    for root, dirs, files in os.walk(fonts_dir):
        for file in files:
            if file.lower().endswith(('.ttf', '.otf')):
                relative_path = os.path.relpath(os.path.join(root, file), '.')
                font_name = os.path.splitext(file)[0].replace('-', ' ').replace('_', ' ')
                font_files.append({
                    'name': font_name,
                    'path': relative_path,
                    'family': font_name.replace(' ', '')
                })
    
    with open(registry_file, 'w') as f:
        json.dump(font_files, f, indent=2)
        
    print(f"Generated {registry_file} with {len(font_files)} fonts.")
    
    # Generate YAML for pubspec.yaml
    print("\nAdd this to your pubspec.yaml under 'flutter:':")
    print("  fonts:")
    for font in font_files:
        print(f"    - family: {font['family']}")
        print(f"      fonts:")
        print(f"        - asset: {font['path']}")

if __name__ == "__main__":
    generate_fonts_registry()
