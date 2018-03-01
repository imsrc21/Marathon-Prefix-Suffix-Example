import Foundation
import Files

let arguments = CommandLine.arguments

guard arguments.count > 1 else {
    print("Please provide valid suffix")
    exit(1)
}

let suffix = arguments[1]
var renamedFileCount = 0

for file in FileSystem().currentFolder.files {
    let previousName = file.name
    try file.rename(to: file.nameExcludingExtension + suffix)
    print("\(previousName) Changed to \(file.name)")

    renamedFileCount += 1
}

print("✅  Added suffix \"\(suffix)\" to \(renamedFileCount) files")
