import Foundation
import Files

let arguments = CommandLine.arguments

guard arguments.count > 1 else {
    print("Please provide valid prefix")
    exit(1)
}

let prefix = arguments[1]
var renamedFileCount = 0

for file in FileSystem().currentFolder.files {
    let previousName = file.name
    try file.rename(to: prefix + file.nameExcludingExtension)
    print("\(previousName) Changed to \(file.name)")

    renamedFileCount += 1
}

print("✅  Added prefix \"\(prefix)\" to \(renamedFileCount) files")
