import os

def update_pubspec():
    pubspec_path = 'pubspec.yaml'
    yaml_path = 'fonts_yaml.txt'
    
    if not os.path.exists(yaml_path):
        print(f"Error: {yaml_path} not found.")
        return

    with open(yaml_path, 'r') as f:
        # Skip the first few lines of the generated file
        lines = f.readlines()
        font_lines = []
        start_collecting = False
        for line in lines:
            if line.strip() == 'fonts:':
                start_collecting = True
            if start_collecting:
                font_lines.append(line)
    
    with open(pubspec_path, 'r') as f:
        pubspec_lines = f.readlines()
    
    new_pubspec_lines = []
    in_flutter_section = False
    fonts_inserted = False
    
    for line in pubspec_lines:
        new_pubspec_lines.append(line)
        if line.strip() == 'flutter:':
            in_flutter_section = True
            # Insert assets section right after flutter:
            new_pubspec_lines.append('  assets:\n')
            new_pubspec_lines.append('    - assets/fonts.json\n')
        
        if in_flutter_section and not fonts_inserted:
            # We look for a place to insert the fonts
            # For simplicity, we'll insert after uses-material-design: true
            if 'uses-material-design: true' in line:
                new_pubspec_lines.extend(font_lines)
                fonts_inserted = True
                
    with open(pubspec_path, 'w') as f:
        f.writelines(new_pubspec_lines)
        
    print(f"Updated {pubspec_path} with assets and {len(font_lines)//3} font entries.")

if __name__ == "__main__":
    update_pubspec()
