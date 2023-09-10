using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebAPI_TodoList.Infra.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddNewTableTodo : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Tasks",
                columns: table => new
                {
                    TodoId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Title = table.Column<string>(type: "VARCHAR(100)", nullable: false),
                    Description = table.Column<string>(type: "VARCHAR(250)", nullable: false),
                    DtTodoFinal = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DtTodoInitial = table.Column<DateTime>(type: "datetime2", nullable: false),
                    StatusTodo = table.Column<int>(type: "INT", nullable: false),
                    UserId = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UserCustomId = table.Column<string>(type: "nvarchar(450)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Tasks", x => x.TodoId);
                    table.ForeignKey(
                        name: "FK_Tasks_AspNetUsers_UserCustomId",
                        column: x => x.UserCustomId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Tasks_DtTodoFinal",
                table: "Tasks",
                column: "DtTodoFinal")
                .Annotation("SqlServer:Clustered", false);

            migrationBuilder.CreateIndex(
                name: "IX_Tasks_DtTodoInitial",
                table: "Tasks",
                column: "DtTodoInitial")
                .Annotation("SqlServer:Clustered", false);

            migrationBuilder.CreateIndex(
                name: "IX_Tasks_UserCustomId",
                table: "Tasks",
                column: "UserCustomId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Tasks");
        }
    }
}
