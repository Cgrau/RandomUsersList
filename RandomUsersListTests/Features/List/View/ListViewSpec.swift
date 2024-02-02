import SnapshotTesting
import XCTest
@testable import RandomUsersList

class ListViewSpec: XCTestCase {
   
   private var sut: ListView!
   private var adapter: ListTableViewAdapter!
   
   override func setUp() {
      sut = listView()
      let controller = ListRowCellController.buildDefault()
      adapter = .init(tableView: sut.tableView,
                      delegate: nil,
                      controller: controller)
   }
   
   func test_empty_list_view_state() {
      givenEmptyState()
      assertSnapshot(matching: sut, as: .image)
   }
   
   func test_list_view_filled_state() {
      givenUsers()
      assertSnapshot(matching: sut, as: .image)
   }
   
   override func tearDown() {
      sut = nil
   }
   
   func givenUsers() {
      let viewModel: ListViewModel = .init(title: "LoremIpsum",
                                           placeholder: "LoremIpsum",
                                           users: [UserCellViewModel](repeating: UserCellViewModel.mock, count: 10))
      adapter.set(viewModels: viewModel.users)
      sut.apply(viewModel: viewModel)
   }
   
   func givenEmptyState() {
      let viewModel: ListViewModel = .init(title: "LoremIpsum",
                                           placeholder: "LoremIpsum",
                                           users: [])
      adapter.set(viewModels: [])
      sut.apply(viewModel: viewModel)
   }
}

extension ListViewSpec {
   private func listView() -> ListView {
      return ListView(frame: viewControllerFrame)
   }
}
