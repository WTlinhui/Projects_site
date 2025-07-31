document.addEventListener('DOMContentLoaded', function () {
  console.log('main.js 読み込み完了 ✅');

  // ✅ 全選択チェックボックス
  const selectAllCheckbox = document.getElementById('select-all');
  if (selectAllCheckbox) {
    selectAllCheckbox.addEventListener('change', function () {
      document.querySelectorAll('.project-checkbox').forEach(cb => {
        cb.checked = selectAllCheckbox.checked;
      });
    });
  }

  // ✅ 詳細表示／非表示トグル処理
  window.togglePreview = function (id) {
    const preview = document.getElementById(`preview-${id}`);
    const collapse = document.getElementById(`detail-${id}`);
    const button = document.getElementById(`toggle-btn-${id}`);

    if (!collapse.dataset.listenerAdded) {
      collapse.addEventListener('shown.bs.collapse', () => {
        button.textContent = '詳細を閉じる';
        preview.style.display = 'none';
      });
      collapse.addEventListener('hidden.bs.collapse', () => {
        button.textContent = '詳細を見る';
        preview.style.display = '';
      });
      collapse.dataset.listenerAdded = true;
    }
  };

  // ✅ 編集保存（モーダル内非同期）
  document.querySelectorAll('.edit-form').forEach(form => {
    form.addEventListener('submit', function (e) {
      e.preventDefault();
      const id = this.dataset.id;
      const formData = new FormData(this);
      const csrf = document.querySelector('[name=csrfmiddlewaretoken]')?.value;

      fetch(`/projects/update/${id}/`, {
        method: 'POST',
        body: formData,
        headers: {
          'X-CSRFToken': csrf
        }
      })
      .then(res => res.json())
      .then(data => {
        if (data.success) {
          // 🔧 詳細表示を更新
          const preview = document.getElementById(`preview-${id}`);
          if (preview) {
            const withBreaks = data.updated_detail.replace(/\n/g, '<br>');
            preview.innerHTML = withBreaks;
          }

          // 🆕 ステータス表示を更新
          const statusEl = document.getElementById(`status-${id}`);
          if (statusEl) {
            const isOpen = data.updated_status === 'open';
            statusEl.textContent = isOpen ? '募集中' : '募集終了';
            statusEl.className = 'badge ' + (isOpen ? 'bg-success' : 'bg-secondary');
          }

          // モーダルを閉じる
          const modalEl = document.getElementById(`editModal-${id}`);
          const modalInstance = bootstrap.Modal.getInstance(modalEl);
          modalInstance?.hide();
        }
      });
    });
  });

  // ✅ 削除モーダルの発火用
  window.confirmDelete = function (id) {
    deleteId = id;
    const modal = bootstrap.Modal.getOrCreateInstance(document.getElementById('deleteModal'));
    modal.show();
  };

  // ✅ 削除確定処理
  let deleteId = null;
  const deleteBtn = document.getElementById('confirmDeleteBtn');
  if (deleteBtn) {
    deleteBtn.addEventListener('click', function () {
      const csrf = document.querySelector('[name=csrfmiddlewaretoken]')?.value;

      fetch(`/projects/delete/${deleteId}/`, {
        method: 'POST',
        headers: {
          'X-CSRFToken': csrf
        }
      })
      .then(res => res.json())
      .then(data => {
        if (data.success) {
          const card = document.getElementById(`project-card-${deleteId}`);
          const column = card?.closest('.col-md-4');
          column?.remove();

          const modal = bootstrap.Modal.getInstance(document.getElementById('deleteModal'));
          modal?.hide();
        }
      });
    });
  }

  // ✅ 共通UI更新関数（未使用だが念のため残し）
  function updateUIStatus(statusText) {
    const label = document.getElementById('status-label');
    if (label) label.textContent = statusText;
  }
});
