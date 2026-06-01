//
//  AccountsView.swift
//  CMB
//

import SwiftUI

struct AccountView: View {
    @StateObject private var viewModel: AccountsViewModel
    @EnvironmentObject var navigator: AppNavigator
    @State private var settingsAccount: AccountInfo? = nil
    @State private var showRenameDialog: Bool = false
    @State private var renameTargetName: String = ""
    @State private var hiddenAccountIDs: Set<String> = []
    @State private var renamedAccounts: [String: String] = [:]

    init(onOpenAccount: (() -> Void)? = nil) {
        let vm = AccountsViewModel()

        vm.onOpenAccount = onOpenAccount
        _viewModel = StateObject(wrappedValue: vm)
    }

    var body: some View {
        ZStack(alignment: .top) {
            AppBackground()

            VStack(spacing: 0) {
                ScreenContent {
                    VStack(spacing: 0) {
                        
                        AppNavBar(title: "Accounts")
                 
                        TotalBalanceCard()
                    }
                }
                
                AccountSheet(
                    selectedTab: Binding(
                        get: { viewModel.selectedTab },
                        set: { viewModel.didSelectTab($0) }
                    ),
                    onSelectTab: viewModel.didSelectTab,
                    accounts: viewModel.filteredAccounts.map { account in
                       
                        var modified = account
                        modified.name = renamedAccounts[account.number] ?? account.name
                        return modified
                    },
                    hiddenAccountIDs: $hiddenAccountIDs,
                    onAccountSettings: { account in
                        settingsAccount = account
                    }
                )
            }

            VStack {
                Spacer()
                ScreenContent {
                    PrimaryButton(
                        title: "ACCOUNT OPENING",
                        action: viewModel.didTapOpenAccount
                    )
                }
                .padding(.bottom, 28)
            }

            if let account = settingsAccount {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(Animation.easeInOut(duration: 0.3)) {
                            settingsAccount = nil
                        }
                    }
                    .transition(.opacity)

                VStack {
                    Spacer()
                    NativeAccountSettingsSheet(
                        account: account,
                        notificationsEnabled: false,
                        onDismiss: {
                            withAnimation(Animation.easeInOut(duration: 0.3)) {
                                settingsAccount = nil
                            }
                        },
                        onRename: {
                            renameTargetName = renamedAccounts[account.number] ?? account.name
                            withAnimation(Animation.easeInOut(duration: 0.3)) {
                                settingsAccount = nil
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                                showRenameDialog = true
                            }
                        },
                        onHide: {
                            hiddenAccountIDs.insert(account.number)
                            withAnimation(Animation.easeInOut(duration: 0.3)) {
                                settingsAccount = nil
                            }
                        },
                        onShare: {},
                        onParentControl: {}
                    )
                }
                .ignoresSafeArea()
                .transition(.move(edge: .bottom))
               
            }

            if showRenameDialog {
                RenameDialog(
                    currentName: renameTargetName,
                    onCancel: {
                        withAnimation(Animation.easeInOut(duration: 0.3)) {
                            showRenameDialog = false
                        }
                    },
                    onSave: { newName in
                       
                        if let account = viewModel.filteredAccounts.first(where: {
                            (renamedAccounts[$0.number] ?? $0.name) == renameTargetName
                        }) {
                            renamedAccounts[account.number] = newName
                            UserDefaults.standard.set(renamedAccounts, forKey: "renamedAccounts")
                        }
                        withAnimation(Animation.easeInOut(duration: 0.3)) {
                            showRenameDialog = false
                        }
                    }
                )
                .transition(.opacity.combined(with: .scale(scale: 0.95)))
            }
        }
        .animation(Animation.easeInOut(duration: 0.3), value: settingsAccount != nil)
        .animation(Animation.easeInOut(duration: 0.3), value: showRenameDialog)
        .navigationBarHidden(true)
        .onAppear {
            if let saved = UserDefaults.standard.dictionary(forKey: "renamedAccounts") as? [String: String] {
                renamedAccounts = saved
            }
        }
    }
}

#Preview {
    NavigationView {
        AccountView( onOpenAccount: {})
    }
    .navigationViewStyle(.stack)
}
