package com.s2b.infra;

import com.hashicorp.cdktf.*;


public class Main {
    public static void main(String[] args) {
        final App app = new App();
        TerraformStack stack = new MainStack(app, "cdktf");
        new RemoteBackend(stack, RemoteBackendConfig.builder()
                .hostname("app.terraform.io")
                .organization("smile2buy")
                .workspaces(new NamedRemoteWorkspace("cdktf"))
                .build());
        app.synth();
    }
}